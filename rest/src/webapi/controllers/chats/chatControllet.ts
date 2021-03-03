import { IChatsService } from './../../../core/services/iServices';
import { BaseController } from './../baseController';
import { Request, Response } from "express";
import { Chat } from '../../../core/domain/models';
export class ChatController extends BaseController {

    constructor(private chatsService: IChatsService) {
        super();
        this.config();
    }

    config() {
        this.createChat();
        this.router.get('/', (req, res) => this.list(req, res))
        this.router.get('/:id', (req, res) => this.getChat(req, res))

    }

    async createChat() {
        try {
            const chats = await this.chatsService.findAll();
            if (chats.length == 0)
                await this.chatsService.add(new Chat());
        } catch (error) {
            console.error(error);
            this.createChat();
        }
    }

    async getChat(req: Request, res: Response) {
        try {
            const chat = await this.chatsService.get(req.params.id);

            res.status(200).json(chat);

        } catch (error) {

            console.log(error);
            res.sendStatus(500);
        }
    }

    async list(req: Request, res: Response) {

        try {

            const chat = await this.chatsService.findAll();

            res.status(200).json(chat);

        } catch (error) {
            console.log(error);
            res.sendStatus(500);
        }

    }

}