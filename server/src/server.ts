import dotenv from "dotenv";
dotenv.config();

import app from "./config/app";
import applyRoutes from "./config/routes";

applyRoutes(app);
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`[server]: Server is running at http://localhost:${port}`);
});
