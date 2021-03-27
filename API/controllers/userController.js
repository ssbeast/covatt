const User = require("../models/user");

exports.getUsers = async (req, res, next) => {
  if (res.locals.isAdmin) {
    try {
      User.find()
        .populate("vaccinations", "brand vaccinator location")
        .then((users) => {
          if (users.length) {
            return res.status(200).json({
              success: true,
              totalUsers: users.length,
              data: users,
            });
          }
          const noUserFound = new Error("no users found");
          return next(noUserFound);
        });
    } catch (err) {
      return res.status(500).json({
        success: false,
        error: err,
      });
    }
  } else {
    return res.status(500).json({
      success: false,
      error: "Only Admin Has Access To This Route",
    });
  }
};

exports.addUser = async (req, res, next) => {
  try {
    const userData = req.body;
    const rawKey = req.body.rawKey;
    const user = await User.create(userData);
    user.integrityKey = rawKey;
    return res.status(200).json({
      success: true,
      data: user,
    });
  } catch (err) {
    return res.status(500).json({
      success: false,
      error: err,
    });
  }
};

exports.getUser = async (req, res, next) => {
  try {
    User.findById(req.params.id)
      .populate("vaccinations", "brand vaccinator location createdAt")
      .populate("linkedAccounts", "name contactNumber vaccinations")
      .then(async (user) => {
        user.integrityKey = "azs";
        return res.status(200).json({
          success: true,
          data: user,
        });
      });
  } catch (err) {
    return res.status(500).json({
      success: false,
      error: err,
    });
  }
};

exports.deleteUser = async (req, res, next) => {
  try {
    const user = await User.findById(req.params.id);
    await user.remove();
    return res.status(200).json({
      success: true,
      data: `user ${user.name} with id ${user._id} was deleted`,
    });
  } catch (err) {
    return res.status(500).json({
      success: false,
      error: err,
    });
  }
};

exports.linkUsers = async (req, res, next) => {
  const selfId = req.params.id;
  const toLinkId = req.query.with;
  if (toLinkId) {
    User.findByIdAndUpdate(
      selfId,
      {
        $push: { linkedAccounts: toLinkId },
      },
      {
        new: true,
      }
    ).exec((err, result) => {
      if (err) {
        return res.status(422).json({ success: false, error: err });
      } else {
        User.findByIdAndUpdate(
          toLinkId,
          {
            $push: { linkedAccounts: selfId },
          },
          {
            new: true,
          }
        ).exec((err, result) => {
          if (err) {
            return res.status(422).json({ success: false, error: err });
          } else {
            return res
              .status(200)
              .json({ success: true, data: "Account linked succesfully" });
          }
        });
      }
    });
  } else {
    return res.status(422).json({
      success: false,
      error: "Both selfId and toLinkId are required!",
    });
  }
};
