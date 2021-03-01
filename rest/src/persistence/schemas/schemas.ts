import { model, Schema } from "mongoose";

const UserSchema = new Schema({
    username: String,
    password: String
}).set('toObject', { getters: true })

const GlobalChatSchema = new Schema({
    messages: [{
        userId: String,
        content: String,
        dateSent: Date
    }],
    dateModified: Date
}).set('toObject', { getters: true })

const ChatSchema = new Schema({
    users: [{
        userId: String,
        index: true
    }],
    messages: [{
        userId: String,
        content: String,
        dateSent: Date
    }],
    dateModified: Date
}).set('toObject', { getters: true })

export const usersModel = model('Users', UserSchema)
export const globalChatModel = model('GlobalChat', GlobalChatSchema)
export const chatModel = model('Chat', ChatSchema)
