export class User {
    private _id?: string;
    username?: string;
    password?: string;

    get id() {

        return this._id ?? "";
    }

    set id(id: string) { this._id = id }

}

export class Chat {
    private _id?: string;
    messages: Message[] = [];


    get id() {

        return this._id ?? "";
    }

    set id(id: string) { this._id = id }
}

export class Message {
    private _id?: string;
    userId?: string;
    username?: string;
    content?: string;
    dateSent?: Date;

    get id() {

        return this._id ?? "";
    }

    set id(id: string) { this._id = id }

}