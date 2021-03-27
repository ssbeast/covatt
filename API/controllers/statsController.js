const axios = require("axios");
const Vaccine = require("../models/vaccine");

const { BIN_API_KEY, BIN_BASE_URL } = require("../config/keys.js");

function getQtyBin() {
  return new Promise((resolve) => {
    axios({
      method: "get",
      url: BIN_BASE_URL,
      headers: {
        "secret-key": BIN_API_KEY,
      },
    })
      .then(function (res) {
        res = res.data;
        resolve(res);
      })
      .catch(function (err) {
        console.log(err);
      });
  });
}

exports.getStats = async (req, res, next) => {
  const inStock = await getQtyBin();
  const vaccineRecords = await Vaccine.find();
  const givenDoses = vaccineRecords.length;
  return res.status(200).json({
    dosesInStock: inStock.qty,
    dosesGiven: givenDoses,
    lastVaccineGivenAt: inStock.lastUpdate,
  });
};

exports.updateQtyBin = async () => {
  const dateObj = new Date();
  const dateNow = dateObj.toString();
  const res = await getQtyBin();
  const updatedQty = res.qty - 1;
  try {
    await axios({
      method: "put",
      url: BIN_BASE_URL,
      headers: {
        "Content-Type": "application/json",
        "secret-key": BIN_API_KEY,
        versioning: false,
      },
      data: {
        qty: updatedQty,
        lastUpdate: dateNow,
      },
    });
  } catch (err) {
    console.log(err);
  }
};
