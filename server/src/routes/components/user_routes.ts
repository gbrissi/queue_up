import { Router } from "express";
import RouteBase from "../route_base";
import UserController from "../../controllers/user_controller";

export default new RouteBase({
  name: "users",
  builder: (router: Router) => {
    const userController = new UserController();
    router.get("/", (req, res) => userController.findAll(req, res));
    
    return router;
  },
});
