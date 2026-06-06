import express, { Express } from "express";
import helmet from "helmet";
import cors from "cors";

const app: Express = express();
// TODO:
app.use(helmet());
app.use(cors());

export default app;
