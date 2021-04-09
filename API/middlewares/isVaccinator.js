const argon2 = require("argon2");
const User = require("../models/user");

exports.isVaccinator = async (req, res, next) => {
  return next();
  if (res.locals.isAdmin) {
    return next();
  }
  try {
    const vaccinatorId = req.headers["x-vaccinator-id"];
    const vaccinatorIntegrityKey = req.headers["x-integrity-key"];
    if (!vaccinatorIntegrityKey) {
      return res
        .status(422)
        .json({ success: false, error: "integrity key is misssing" });
    }
    if (!vaccinatorId) {
      return res
        .status(422)
        .json({ success: false, error: "vaccinator id is misssing" });
    }
    const vaccinator = await User.findById(vaccinatorId);
    if (!vaccinator) {
      return res.status(404).json({
        success: false,
        error: "Vaccinator Not Found",
      });
    }
    let vaccinatorAcess = false;
    if (vaccinator.role === "vaccinator") {
      vaccinatorAcess = true;
    }
    if (
      (await argon2.verify(vaccinator.integrityKey, vaccinatorIntegrityKey)) &&
      vaccinatorAcess
    ) {
      return next();
    } else {
      return res.status(402).json({
        success: false,
        data: "vaccinator's integrity couldn't be verified",
      });
    }
  } catch (err) {
    return next(err);
  }
};
