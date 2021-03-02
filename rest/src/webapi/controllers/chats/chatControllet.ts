import { IChatsService } from './../../../core/services/iServices';
import { BaseController } from './../baseController';
import { Request, Response } from "express";
export class ChatController extends BaseController {

    constructor(private chatsService: IChatsService) {
        super();
        this.config();
    }

    config() {
        this.router.get('/', (req, res) => this.list(req, res))
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