import { Router } from "express";

export default class RouteBase {
  public name: string;
  public router: Router;

  constructor(name: string) {
    this.name = name;
    this.router = Router();
  }
}
