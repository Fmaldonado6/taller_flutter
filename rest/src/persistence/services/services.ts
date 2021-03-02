import { usersModel, chatModel } from './../schemas/schemas';
import { IUsersService, IChatsService } from '../../core/services/iServices';
import { User, Chat, Message } from './../../core/domain/models';
import { Model } from 'mongoose';
import { Service } from './service';

export class UsersService extends Service<User> implements IUsersService {

    async getByUsername(username: string): Promise<User> {
        return await this.getModel().findOne({ username: username });
    }

    getModel(): Model<any> {
        return usersModel;
    }

}


export class ChatsService extends Service<Chat> implements IChatsService {
    async addMessage(message: Message): Promise<void> {
        const messageAny = message as any;
        await this.getModel().findOneAndUpdate({ _id: message.chatId }, { $push: { messages: messageAny } })
    }
    getModel(): Model<any> {
        return chatModel;
    }
}