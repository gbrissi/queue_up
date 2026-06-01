import path from "path";
import RouteBase from "./route_base";

const files = require("fs").readdirSync(path.join(__dirname, "./components"));

for (const file of files) {
  const route = require(`./components/${file}`).default;
  if (route instanceof RouteBase) {
    app.use(`/${route.name}`, route.router);
  } else {
    console.error(
      `Route ${file} is not an instance of RouteBase. Please check the file.`,
    );
  }
}
