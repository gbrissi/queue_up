import { Request, Response } from "express";

export default class UserController {
  constructor() {}
  findAll(req: Request, res: Response) {
    res.json({ user: "test" });
  }
}
