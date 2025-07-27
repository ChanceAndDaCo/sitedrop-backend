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
app.listen(PORT, () => {
    console.log(`SiteDrop Backend is listening on port ${PORT}`);
});
