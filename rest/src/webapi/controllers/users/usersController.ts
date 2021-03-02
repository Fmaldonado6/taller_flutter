import { CustomRequest } from './../baseController';
import { IUsersService } from './../../../core/services/iServices';
import { BaseController } from "../baseController";
import { User } from '../../../core/domain/models';
import { Request, Response } from "express";
import bcrypt from 'bcryptjs';
class UsersController extends BaseController {
    constructor(private usersService: IUsersService) {
        super();
        this.config();
    }

    config() {
        this.router.post('/', (req, res) => this.create(req as CustomRequest, res))
        this.router.delete('/:id', (req, res) => this.delete(req as CustomRequest, res))
        this.router.put('/username', (req, res) => this.updateUsername(req as CustomRequest, res))
        this.router.put('/password', (req, res) => this.updatePassword(req as CustomRequest, res))
    }


    public async create(req: CustomRequest, res: Response) {


        try {
            const user: User = req.body

            if (!user)
                res.sendStatus(400);

            const salt = await bcrypt.genSalt();

            const hashedPassword = await bcrypt.hash(user.password!!, salt);

            user.password = hashedPassword;

            await this.usersService.add(user);

            res.status(200).json({})

        } catch (error) {
            console.log(error)
            res.sendStatus(500)
        }

    }


    public async updateUsername(req: CustomRequest, res: Response) {

        try {


            const user: User = req.body;

            const reqId = req.id;

            if (reqId != user.id)
                return res.sendStatus(403);
                
            if (!user)
                return res.sendStatus(400);

            const savedUser = await this.usersService.get(user.id)

            if (!savedUser)
                return res.sendStatus(404);

            savedUser.username = user.username;

            const updatedUser = await this.usersService.update(savedUser);

            res.status(200).json({ username: updatedUser.username, id: updatedUser.id })

        } catch (error) {
            console.log(error)
            res.sendStatus(500)
        }
    }

    public async updatePassword(req: CustomRequest, res: Response) {

        try {


            const user: User = req.body;
            const reqId = req.id;

            if (reqId != user.id)
                return res.sendStatus(403);

            if (!user)
                return res.sendStatus(400);

            const savedUser = await this.usersService.get(user.id)

            if (!savedUser)
                return res.sendStatus(404);

            const salt = await bcrypt.genSalt();

            const hashedPassword = await bcrypt.hash(user.password!!, salt);

            savedUser.password = hashedPassword;

            const updatedUser = await this.usersService.update(savedUser);

            res.status(200).json({ username: updatedUser.username, id: updatedUser.id })

        } catch (error) {
            console.log(error)
            res.sendStatus(500)
        }
    }

    public async delete(req: CustomRequest, res: Response) {


        try {
            const reqId = req.id;
            const id = req.params.id;

            if (reqId != id)
                return res.sendStatus(403);

            await this.usersService.delete(id);

            res.status(200).json({})


        } catch (error) {
            console.log(error)
            res.sendStatus(500)
        }
    }
}