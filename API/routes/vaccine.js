const express = require("express");
const router = express.Router();

const {
  addVaccineRecord,
  getVaccineRecord,
  deleteVaccineRecord,
  getVaccineRecords,
} = require("../controllers/vaccineController");
const { checkAdmin } = require("../middlewares/checkAdmin");
const { isVaccinator } = require("../middlewares/isVaccinator");

router
  .route("/")
  .get(checkAdmin, isVaccinator, getVaccineRecords)
  .post(checkAdmin, isVaccinator, addVaccineRecord);

router
  .route("/:id")
  .get(checkAdmin, isVaccinator, getVaccineRecord)
  .delete(checkAdmin, isVaccinator, deleteVaccineRecord);

module.exports = router;
