import express, { Application, Request, Response, NextFunction } from "express";
import morgan from "morgan";

const app: Application = express();

// Middleware
app.use(morgan("dev"));
// Routes
app.get("/users", function (req: Request, res: Response) {
    res.send({ message: "User Service" });
});

// Server Port
const PORT = process.env.PORT || 3100;
app.listen(PORT, () => console.log(`Listening on port ${PORT}`));
