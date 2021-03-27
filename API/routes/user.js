const express = require("express");
const router = express.Router();
const unless = require("../utilities/unless");

const {
  addUser,
  getUser,
  deleteUser,
  getUsers,
  linkUsers,
} = require("../controllers/userController");
const { addIntegrityKey } = require("../middlewares/addIntegrityKey");
const { checkAdmin } = require("../middlewares/checkAdmin");
const { checkIntegrity } = require("../middlewares/checkIntegrity");

router
  .route("/")
  .get(checkAdmin, getUsers)
  .post(checkAdmin, addIntegrityKey, addUser);

router
  .route("/:id")
  .get(checkAdmin, checkIntegrity, getUser)
  .delete(checkAdmin, checkIntegrity, deleteUser);

router.route("/link/:id").post(checkAdmin, checkIntegrity, linkUsers);

module.exports = router;
