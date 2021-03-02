import { CustomRequest } from './../baseController';
import { IUsersService } from './../../../core/services/iServices';
import { BaseController } from "../baseController";
import { User } from '../../../core/domain/models';
import { Response } from "express";
import bcrypt from 'bcryptjs';
export class UsersController extends BaseController {
    constructor(private usersService: IUsersService) {
        super();
        this.config();
    }

    config() {
        this.router.post('/', (req, res) => this.create(req as CustomRequest, res))
        this.router.delete('/:id', this.verifyToken, (req, res) => this.delete(req as CustomRequest, res))
        this.router.get('/:id', this.verifyToken, (req, res) => this.getUser(req as CustomRequest, res))
        this.router.get('/', this.verifyToken, (req, res) => this.getUsers(req as CustomRequest, res))
        this.router.put('/username', this.verifyToken, (req, res) => this.updateUsername(req as CustomRequest, res))
        this.router.put('/password', this.verifyToken, (req, res) => this.updatePassword(req as CustomRequest, res))
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


            const updatedUser = await this.usersService.update(user);


            if (!updatedUser)
                return res.sendStatus(404);

            res.status(200).json({ username: updatedUser.username, id: updatedUser.id })

        } catch (error) {
            console.log(error)
            res.sendStatus(500)
        }
    }

    async getUser(req: CustomRequest, res: Response) {

        try {

            const user = await this.usersService.get(req.params.id);

            res.status(200).json(user);

        } catch (error) {
            console.log(error);
            res.sendStatus(500);
        }

    }

    async getUsers(req: CustomRequest, res: Response) {

        try {

            const users = await this.usersService.findAll();

            res.status(200).json(users);

        } catch (error) {
            console.log(error);
            res.sendStatus(500);
        }

    }

    public async updatePassword(req: CustomRequest, res: Response) {

        try {


            const user: User = req.body;
            const reqId = req.id;
            console.log(user)
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

            if (!updatedUser)
                return res.sendStatus(404);


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