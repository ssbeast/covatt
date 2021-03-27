const neatCsv = require("neat-csv");
const fs = require("fs");
const { redis } = require("./db");
const path = require("path");

exports.setVaccinatorsRecords = () =>
  fs.readFile(
    path.resolve(".", "db/vaccinatorsWorkbook.csv"),
    async (err, data) => {
      if (err) {
        console.error(err);
        return;
      }
      await neatCsv(data).then((data) => {
        let phoneNumbers = [];
        data.forEach((vaccinator) => {
          phoneNumbers.push(vaccinator.number);
        });
        const phonNumbersObj = { phoneNumbers };
        redis.set("vaccinatorsPhoneNumber", JSON.stringify(phonNumbersObj));
      });
    }
  );
