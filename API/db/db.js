const mongoose = require("mongoose");
const chalk = require("chalk");
const Redis = require("ioredis");

const {
  MONGO_DB_PASS,
  MONGO_DB_USER,
  MONGO_DB_URI,
  ADMIN_KEYS,
} = require("../config/keys.js");

const redis = new Redis();
redis.set("adminKeys", JSON.stringify(ADMIN_KEYS));

connectDB = async () => {
  try {
    mongoose.connect(MONGO_DB_URI, {
      user: MONGO_DB_USER,
      pass: MONGO_DB_PASS,
      useNewUrlParser: true,
      useCreateIndex: true,
      useFindAndModify: true,
      useUnifiedTopology: true,
    });
    console.log(chalk.blue("connected to mongo database"));
  } catch (err) {
    console.log(err);
    process.exit(1);
  }
};

module.exports = { redis, connectDB };
