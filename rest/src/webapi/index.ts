import express, { Application } from "express";
import dotenv from 'dotenv'
import cors from 'cors';
import expressWs from 'express-ws'
import morgan from 'morgan';

const expressWsInstance = expressWs(express());

class Main {
    private app: Application

    constructor() {
        this.app = expressWsInstance.app;
        this.config();
        this.routes();
    }

    config() {
        dotenv.config();
        this.app.set('port', process.env.PORT || 4000);
        this.app.use(morgan('dev'));
        this.app.use(cors());
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: false }));

    }

    routes() {

    }


    start() {
        const port = this.app.get('port');
        this.app.listen(port, () => {
            console.log(`Server listening on port ${port}`)
        })
    }

}

const main = new Main();
main.start();