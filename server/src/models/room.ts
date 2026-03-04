import mongoose from "mongoose";

interface IRoom extends Document {
    id: string | mongoose.Types.ObjectId,
    users: string | mongoose.Types.ObjectId,
    
}