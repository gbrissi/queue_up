import dotenv from "dotenv";
dotenv.config();

import app from "./config/app";
import applyRoutes from "./config/routes";
import logger from "./config/logger";

applyRoutes(app);
const port = process.env.PORT || 3000;

app.listen(port, () => {
  logger.info(`[server]: Server is running at http://localhost:${port}`);
});
