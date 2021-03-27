const argon2 = require("argon2");
const { v4: uuidv4 } = require("uuid");

exports.addIntegrityKey = async (req, res, next) => {
  try {
    const rawKey = `${req.body.contactNumber}-${req.body.name}-${uuidv4()}`;
    const integrityKey = await argon2.hash(rawKey);
    req.body.rawKey = rawKey;
    req.body.integrityKey = integrityKey;
    next();
  } catch (err) {
    next(err);
  }
};
