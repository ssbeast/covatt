exports.notFound = (req, res, next) => {
  res.status(404);
  const error = new Error(`404 - Not Found - ${req.originalUrl}`);
  next(error);
};

exports.errorHandler = (err, req, res, next) => {
  const statusCode = res.statusCode !== 200 ? res.statusCode : 500;
  res.status(statusCode);
  res.json({
    message: err.message,
    stack: process.env.NODE_ENV === "production" ? "ass" : err.stack,
  });
};
