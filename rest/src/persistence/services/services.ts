import { usersModel, chatModel } from './../schemas/schemas';
import { IUsersService, IChatsService } from '../../core/services/iServices';
import { User, Chat } from './../../core/domain/models';
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
    getModel(): Model<any> {
        return chatModel;
    }
}