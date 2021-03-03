import { User, WebSocketMessage, WebSocketMessageTypes } from './../../../core/domain/models';
import { Request } from 'express';
import { ChatsService } from './../../../persistence/services/services';
import { BaseController } from './../baseController';
import expressWs from 'express-ws';

interface Client {
    websocket: any;
    userId: string
}

export class WebSocketController extends BaseController {
    public clientsConnected = new Map<string, Client>();


    constructor(private chatsService: ChatsService) {
        super();
        this.config();
    }

    config() {
        this.router.ws('/client', (ws, req) => this.clientConnected(ws, req))
    }

    clientConnected(ws: any, req: Request) {


        ws.on('message', (msg: string) => { this.readMessage(ws, msg) })

        ws.on('close', () => { this.closeConnection(ws) })

        ws.on('pong', () => { this.pong(ws) })

    }

    readMessage(ws: any, message: string) {

        const parsedMessage = JSON.parse(message) as WebSocketMessage;

        if (parsedMessage.type != WebSocketMessageTypes.connected)
            return this.sendToClients(parsedMessage, ws)

        const client = <Client>{};
        ws.id = this.clientsConnected.size;
        client.userId = this.clientsConnected.size.toString();
        client.websocket = ws;
        this.clientsConnected.set(client.userId, client)
    }

    async sendToClients(message: WebSocketMessage, ws: any) {

        try {
            if (message.type == WebSocketMessageTypes.message)
                await this.chatsService.addMessage(message.content!!)

            this.clientsConnected.forEach((val, key) => {
                if (val.websocket.connected && key != ws.id)
                    val.websocket.send(JSON.stringify(message))
            })
        } catch (error) {
            console.error(error)
        }
    }

    closeConnection(ws: any) {
        this.clientsConnected.delete(ws.id);
    }

    ping() {
        setInterval(() => {
            try {
                this.clientsConnected.forEach((val, key) => {
                    if (!val.websocket.connected) {
                        val.websocket.terminate();
                        this.clientsConnected.delete(key);
                    }
                    val.websocket.connected = false;
                    val.websocket.ping();
                })
            } catch (error) {
                console.log(error)
            }
        }, 15000)
    }

    pong(ws: any) {
        let client = this.clientsConnected.get(ws.id)
        if (client != null)
            client.websocket.connected = true
    }
}