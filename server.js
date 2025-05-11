const express = require("express");
const cors = require("cors");
const app = express();
const PORT = 8089;

app.use(cors()); // Allow CORS

// Root route returns JSON instead of plain text
app.get("/", (req, res) => {
  res.json({ message: "Welcome to the Backend API!" });
});

app.listen(PORT, () => {
  console.log(`Backend is running on http://localhost:${PORT}`);
});
