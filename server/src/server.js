import app from "./app.js";
const PORT = 8080;

const startServer = async () => {
  app.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`);
  });
};

startServer();
