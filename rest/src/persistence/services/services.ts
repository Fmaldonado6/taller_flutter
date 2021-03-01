import { usersModel, globalChatModel, chatModel } from './../schemas/schemas';
import { IUsersService, IGlobalChatsService, IChatsService } from '../../core/services/iServices';
import { User, Chat } from './../../core/domain/models';
import { Model } from 'mongoose';
import { Service } from './service';

class UsersService extends Service<User> implements IUsersService {
    getModel(): Model<any> {
        return usersModel;
    }

}

class GlobalChatsService extends Service<Chat> implements IGlobalChatsService {
    getModel(): Model<any> {
        return globalChatModel;
    }
}

class ChatsService extends Service<Chat> implements IChatsService {
    getModel(): Model<any> {
        return chatModel;
    }
}