import mongoose, { Schema, Document, Model } from "mongoose";
import { IImage } from "./image";

export interface IUser extends Document {
  _id: mongoose.Types.ObjectId;
  name: string;
  role: string;
  email: string;
  avatar: IImage;
  password: string;

  createdAt: Date;
  updatedAt: Date;
}

const UserSchema: Schema<IUser> = new Schema<IUser>(
  {
    name: {
      type: String,
      required: true,
      trim: true,
    },
    avatar: {
      type: Schema.Types.ObjectId,
      ref: "Image",
    },
    role: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
      unique: true,
      lowercase: true,
      trim: true,
    },
    password: {
      type: String,
      required: true,
    },
  },
  {
    _id: true,
    timestamps: true,
  },
);

export const User: Model<IUser> =
  mongoose.models.User || mongoose.model<IUser>("User", UserSchema);
