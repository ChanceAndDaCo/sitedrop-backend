"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const app = (0, express_1.default)();
const PORT = process.env.PORT || 3001;
app.use((0, cors_1.default)());
app.get("/", (req, res) => {
    res.send("SiteDrop API is running.");
});
app.get("/api/test", (req, res) => {
    res.json({ message: "Test endpoint works!" });
});
app.get("/api/jobs", (req, res) => {
    res.json([
        { id: 1, site: "123 Main St", material: "Drywall", status: "Scheduled" },
        { id: 2, site: "456 Elm Ave", material: "PVC Pipe", status: "Out for delivery" },
        { id: 3, site: "789 Oak Ct", material: "Tile", status: "Delivered" }
    ]);
});
app.listen(PORT, () => {
    console.log(`SiteDrop Backend is listening on port ${PORT}`);
});
