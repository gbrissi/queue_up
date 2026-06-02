import fs from "fs";
import { Express } from "express";
import RouteBase from "../routes/route_base";

export default function applyRoutes(app: Express) {
  const files = fs
    .readdirSync("./src/routes")
    .filter((file) => file.endsWith("_routes.ts"));

  for (const file of files) {
    const route = require(`../routes/${file}`).default;
    if (route instanceof RouteBase) app.use(`/${route.name}`, route.router);
    else console.error(`Route ${file} is not a RouteBase`);
  }
}
