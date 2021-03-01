import { Chat } from '../domain/models';
import { User } from '../domain/models';
import { IService } from './iService';

export interface IUsersService extends IService<User> {

}

export interface IGlobalChatsService extends IService<Chat> {

}


export interface IChatsService extends IService<Chat> {

}

