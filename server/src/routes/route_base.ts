import { Router } from "express";

export default class RouteBase {
  public name: string;
  public router: Router = Router();

  constructor({
    name,
    builder,
  }: {
    name: string;
    builder: (router: Router) => void;
  }) {
    this.name = name;
    builder(this.router);
  }
}
