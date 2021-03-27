const { redis } = require("../db/db");

exports.checkAdmin = async (req, res, next) => {
  const adminKey = req.get("x-admin-key");
  if (adminKey) {
    const [key, username] = adminKey.split("@");
    redis
      .get("adminKeys")
      .then((result) => {
        if (result) {
          return JSON.parse(result);
        }
      })
      .then((result) => {
        if (result[username] == key) {
          res.locals.isAdmin = true;
          next();
        }
      })
      .catch(function (err) {
        next(err);
      });
  } else {
    next();
  }
};
