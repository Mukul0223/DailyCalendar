import express from "express";
import { errorHandler, notFound } from "./middleware/errorHandler.js";

const app = express();

app.use(express.json());

app.get("/api/health", async (req, res) => {
  res.status(200).json({
    status: "ok",
  });
});

app.use(notFound);
app.use(errorHandler);

export default app;
