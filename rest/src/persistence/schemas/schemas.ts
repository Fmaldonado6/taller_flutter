import { model, Schema } from "mongoose";

const UserSchema = new Schema({
    username: String,
    password: String
}).set('toObject', { getters: true })



const ChatSchema = new Schema({
    messages: [{
        username:String,
        content: String,
        dateSent: Date
    }],
}).set('toObject', { getters: true })

export const usersModel = model('Users', UserSchema)
export const chatModel = model('Chat', ChatSchema)
