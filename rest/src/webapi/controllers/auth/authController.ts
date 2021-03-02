import { User } from './../../../core/domain/models';
import { BaseController } from "../baseController";
import { Request, Response } from "express";
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken'
import { IUsersService } from '../../../core/services/iServices';

export class AuthController extends BaseController {
    constructor(private usersService: IUsersService) {
        super();
        this.config();
    }

    config() {
        this.router.post('/', (req, res) => this.login(req, res))
    }

    async login(req: Request, res: Response) {

        try {
            const user: User = req.body;

            if (!user)
                return res.sendStatus(400);

            const foundUser = await this.usersService.getByUsername(user.username!!);

            if (!foundUser)
                return res.sendStatus(404)

            const correct = await bcrypt.compare(user.password!!, foundUser.password!!);

            if (!correct)
                return res.sendStatus(403)


            let token = jwt.sign(
                {
                    username: foundUser.username,
                    id: foundUser.id
                },
                'chunchunmaru')

            res.status(200).json(token)

        } catch (error) {
            console.error(error);
            res.sendStatus(500);
        }

    }
}