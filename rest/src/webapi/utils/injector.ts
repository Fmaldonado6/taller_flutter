import { ChatController } from './../controllers/chats/chatControllet';
import { AuthController } from './../controllers/auth/authController';
import { ChatsService, UsersService } from './../../persistence/services/services';
import { WebSocketController } from '../controllers/webSockets/webSocketController';
const chatService = new ChatsService();
const usersService = new UsersService();

export const authController = new AuthController(usersService);
export const chatController = new ChatController(chatService);
export const webSocketController = new WebSocketController(chatService)

