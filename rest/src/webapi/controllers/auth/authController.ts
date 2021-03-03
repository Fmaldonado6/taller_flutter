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
    }

    async login(req: Request, res: Response) {

       

    }
}