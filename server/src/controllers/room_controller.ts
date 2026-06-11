import RoomService from "../services/room_service";
import ControllerBase from "./controller_base";

export default class RoomController extends ControllerBase {
  roomService = new RoomService();

  createRoom(req: Request, res: Response) {
    this.create({
      promise: this.roomService.createRoom(),
      onSuccess: (data) => {
        return {
          data,
          statusCode: 201,
          message: "Room created successfully",
        };
      },
      onError: (error) => {
        return {
          statusCode: 500,
          message: error.message,
        };
      },
    });
  }
}
