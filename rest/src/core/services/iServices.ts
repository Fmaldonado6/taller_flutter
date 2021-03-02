import { Chat, Message } from '../domain/models';
import { User } from '../domain/models';
import { IService } from './iService';

export interface IUsersService extends IService<User> {

    getByUsername(username: string): Promise<User>;

}

export interface IChatsService extends IService<Chat> {
    addMessage(message: Message): Promise<void>;
}

