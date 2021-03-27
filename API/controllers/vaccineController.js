const User = require("../models/user");
const Vaccine = require("../models/vaccine");

const { updateQtyBin } = require("./statsController");

exports.getVaccineRecords = async (req, res, next) => {
  try {
    Vaccine.find()
      .populate("consumer", "name contactNumber")
      .populate("vaccinator", "name contactNumber")
      .then((vaccines) => {
        const filteredVaccinesRecords = vaccines.filter((vaccine) => {
          return vaccine.vaccinator["_id"] == req.get("x-vaccinator-id");
        });
        return res.status(200).json({
          success: true,
          vaccinatorId: req.get("x-vaccinator-id"),
          totalVaccinationsByThem: filteredVaccinesRecords.length,
          data: filteredVaccinesRecords,
        });
      });
  } catch (err) {
    return res.status(500).json({
      success: false,
      error: err,
    });
  }
};

exports.addVaccineRecord = async (req, res, next) => {
  try {
    const vaccineData = req.body;
    const vaccineRecord = await Vaccine.create(vaccineData);
    updateQtyBin();
    User.findByIdAndUpdate(
      vaccineRecord.consumer,
      {
        $push: { vaccinations: vaccineRecord._id },
      },
      {
        new: true,
      }
    ).exec((err, result) => {
      if (err) {
        return res.status(422).json({ success: false, error: err });
      } else {
        return res.status(200).json({
          success: true,
          data: vaccineRecord,
        });
      }
    });
  } catch (err) {
    return res.status(500).json({
      success: false,
      error: err,
    });
  }
};

exports.getVaccineRecord = async (req, res, next) => {
  try {
    if (!req.params.id) {
      return res
        .status(422)
        .json({ success: false, error: "record id is required!" });
    }
    Vaccine.findById(req.params.id)
      .populate("consumer", "name contactNumber")
      .populate("vaccinator", "name contactNumber")
      .then((vaccineRecord) => {
        if (vaccineRecord) {
          return res.status(200).json({
            success: true,
            data: vaccineRecord,
          });
        }
        return res.status(404).json({
          success: false,
          error: "Vaccine Record Not Found",
        });
      });
  } catch (err) {
    return res.status(500).json({
      success: false,
      error: err,
    });
  }
};

exports.deleteVaccineRecord = async (req, res, next) => {
  try {
    if (!req.params.id) {
      return res
        .status(422)
        .json({ success: false, error: "record id is required!" });
    }
    const vaccineRecord = await Vaccine.findById(req.params.id);
    if (!vaccineRecord) {
      return res.status(404).json({
        success: false,
        error: "Vaccine Record Not Found",
      });
    }
    await vaccineRecord.remove();
    return res.status(200).json({
      success: true,
      data: `vaccination record with id ${vaccineRecord._id} was deleted`,
    });
  } catch (err) {
    return res.status(500).json({
      success: false,
    });
  }
};
