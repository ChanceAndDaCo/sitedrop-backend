import express, { Request, Response } from "express";
import cors from "cors";

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());

app.get("/", (req: Request, res: Response) => {
  res.send("SiteDrop API is running.");
});

app.get("/api/test", (req: Request, res: Response) => {
  res.json({ message: "Test endpoint works!" });
});

app.listen(PORT, () => {
  console.log(`SiteDrop Backend is listening on port ${PORT}`);
});
