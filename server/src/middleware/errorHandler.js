import ApiError from "../utils/ApiError.js";

export const errorHandler = (err, req, res, next) => {
  let normalizedError = err;

  if (err.type === "entity.parse.failed") {
    normalizedError = new ApiError(400, "Invalid JSON payload");
  }

  const isApiError = normalizedError instanceof ApiError;

  const statusCode = isApiError ? normalizedError.statusCode : 500;
  const message = isApiError
    ? normalizedError.message
    : "Internal server error";
  const details = isApiError ? normalizedError.details : undefined;

  if (!isApiError) {
    console.error(err);
  }

  res.status(statusCode).json({
    statusCode,
    message,
    ...(details && { details }),
  });
};

export const notFound = (req, res, next) => {
  next(new ApiError(404, "Not Found"));
};
