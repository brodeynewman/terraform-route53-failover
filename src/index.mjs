import cors from "cors";
import debug from "debug";
import express from "express";
import bodyParser from "body-parser";

const log = debug("api");

const { PORT = 3000 } = process.env;

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.get("/", (req, res) => {
  log("Incoming request:", req.path);

  res.json({ success: true, deploy: "latest" });
});

app.listen(PORT, () => {
  console.log("Listening on port:", PORT);
});
