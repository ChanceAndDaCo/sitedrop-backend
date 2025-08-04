import express, { Request, Response } from "express";
import cors from "cors";
import { PrismaClient } from "@prisma/client";

const app = express();
const PORT = process.env.PORT || 3001;
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json()); // Needed for POST/PUT body parsing

app.get("/", (req: Request, res: Response) => {
  res.send("SiteDrop API is running.");
});

app.get("/api/test", (req: Request, res: Response) => {
  res.json({ message: "Test endpoint works!" });
});

// 🔁 Get all jobs from DB
app.get("/api/jobs", async (req: Request, res: Response) => {
  try {
    const jobs = await prisma.job.findMany();
    res.json(jobs);
  } catch (error) {
    console.error("Error fetching jobs:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.listen(PORT, () => {
  console.log(`SiteDrop Backend is listening on port ${PORT}`);
});
