const argon2 = require("argon2");
const User = require("../models/user");

exports.checkIntegrity = async (req, res, next) => {
  return next();
  if (res.locals.isAdmin) {
    return next();
  }
  try {
    if (!req.params.id) {
      return res
        .status(422)
        .json({ success: false, error: "user id is required!" });
    }
    if (!req.headers["x-integrity-key"]) {
      return res
        .status(422)
        .json({ success: false, error: "integrity key is misssing" });
    }
    const user = await User.findById(req.params.id);
    if (!user) {
      return res.status(404).json({
        success: false,
        error: "User Not Found",
      });
    }
    if (
      await argon2.verify(user.integrityKey, req.headers["x-integrity-key"])
    ) {
      return next();
    } else {
      return res.status(402).json({
        success: false,
        data: "user's integrity couldn't be verified",
      });
    }
  } catch (err) {
    return next(err);
  }
};
