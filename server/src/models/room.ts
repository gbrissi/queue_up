import mongoose, { Schema, Document, Model } from "mongoose";

export interface IRoom extends Document {
  id: string | mongoose.Types.ObjectId;

  title: string;
  description: string;
  image: string | mongoose.Types.ObjectId;

  users: string | mongoose.Types.ObjectId;
  actions: string | mongoose.Types.ObjectId;

  createdAt: Date;
  updatedAt: Date;
}

const RoomSchema = new Schema<IRoom>(
  {
    title: {
      type: String,
      required: true,
      trim: true,
    },
    description: {
      type: String,
      required: true,
    },
    image: {
      type: Schema.Types.ObjectId,
      ref: "Image",
      required: true,
    },
    users: {
      type: Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    actions: {
      type: Schema.Types.ObjectId,
      ref: "Action",
      required: true,
    },
  },
  {
    timestamps: true,
  },
);

const RoomModel: Model<IRoom> = mongoose.model<IRoom>("Room", RoomSchema);

export default RoomModel;
