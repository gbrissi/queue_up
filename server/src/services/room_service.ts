import RoomRepository from "../repositories/room_repository";

export default class RoomService {
  roomRepo = new RoomRepository();

  getPaginatedRooms() {
    return;
  }

  createRoom() {
    this.roomRepo.createRoom();
  }
}
