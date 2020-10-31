import express, { Application, Request, Response, NextFunction } from "express";
import morgan from "morgan";

const app: Application = express();

// Middleware
app.use(morgan("dev"));
// Routes
app.get("/", function (req: Request, res: Response) {
    res.send({ message: "API Gateway" });
});

// Server Port
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Listening on port ${PORT}`));
