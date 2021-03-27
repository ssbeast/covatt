const mongoose = require("mongoose");
const { ObjectId } = mongoose.Schema.Types;

const vaccineSchema = new mongoose.Schema(
  {
    brand: {
      type: String,
      default: "Covaxin",
      enum: [
        "Covaxin",
        "ZyCoV-D",
        "Oxford - AstraZeneca",
        "Biological E",
        "Mynvax",
        "Gennova",
      ],
    },
    consumer: {
      type: ObjectId,
      ref: "User",
    },
    vaccinator: {
      type: ObjectId,
      ref: "User",
    },
    location: {
      type: String,
      required: false,
    },
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Vaccine", vaccineSchema);
