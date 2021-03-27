const mongoose = require("mongoose");
const { ObjectId } = mongoose.Schema.Types;

const userSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, "Name is required"],
    },
    contactNumber: {
      type: String,
      required: [true, "Phonenumber is required"],
    },
    role: {
      type: String,
      default: "consumer",
      enum: ["consumer", "vaccinator"],
    },
    integrityKey: {
      type: String,
      required: [true, "Integrity Key Missing"],
    },
    vaccinations: [{ type: ObjectId, ref: "Vaccine" }],
    linkedAccounts: [{ type: ObjectId, ref: "User" }],
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("User", userSchema);
