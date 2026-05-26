import mongoose, { Schema, Document, Model } from "mongoose";
import { IImageSize, ImageSizeSchema } from "./image_size";

export interface IImage extends Document {
  _id: mongoose.Types.ObjectId;
  filename: string;
  mimetype: string;
  sizes: IImageSize[];
  createdAt: Date;
}

export const ImageSchema: Schema<IImage> = new Schema(
  {
    filename: {
      type: String,
      required: true,
      trim: true,
    },
    mimetype: {
      type: String,
      required: true,
      trim: true,
    },
    sizes: {
      type: [ImageSizeSchema],
      required: true,
      default: [],
    },
  },
  {
    _id: true,
    timestamps: {
      createdAt: true,
      updatedAt: false,
    },
  },
);

export const Image: Model<IImage> =
  mongoose.models.Image || mongoose.model<IImage>("Image", ImageSchema);
