import mongoose, { Schema, Document, Model } from "mongoose";

export enum ImageType {
  ORIGINAL = "original",
  SMALL = "small",
  MEDIUM = "medium",
  LARGE = "large",
}

export interface IImageSize extends Document {
  type: ImageType;
  size: number;
  url: string;
}

export const ImageSizeSchema: Schema<IImageSize> = new Schema<IImageSize>(
  {
    type: {
      type: String,
      enum: Object.values(ImageType),
      required: true,
    },
    size: {
      type: Number,
      required: true,
      min: 0,
    },
    url: {
      type: String,
      required: true,
    },
  },
  {
    _id: false,
    timestamps: true,
  },
);

export const ImageSize: Model<IImageSize> =
  mongoose.models.ImageSize ||
  mongoose.model<IImageSize>("ImageSize", ImageSizeSchema);
