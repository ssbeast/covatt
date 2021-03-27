const express = require("express");
const helmet = require("helmet");

const { connectDB } = require("./db/db.js");
const { setVaccinatorsRecords } = require("./db/setVaccinators");

const userEndpoints = require("./routes/user");
const vaccineEndpoints = require("./routes/vaccine");
const statsEndpoints = require("./routes/stats");
const { notFound, errorHandler } = require("./middlewares/middlewares.js");

const app = express();
connectDB();
setVaccinatorsRecords();

app.use(helmet());
app.use(express.json());

app.use("/covatt-api/v1/user", userEndpoints);
app.use("/covatt-api/v1/vaccine", vaccineEndpoints);
app.use("/covatt-api/v1/stats", statsEndpoints);

app.use(notFound);
app.use(errorHandler);

app.listen(process.env.PORT || 3000);
