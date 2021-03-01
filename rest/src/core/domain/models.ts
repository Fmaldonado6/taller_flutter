export class User {
    private _id?: string;
    username?: string;
    password?: string;
}

export class Chat {
    private _id?: string;
    users?: string[] = [];
    messages: Message[] = [];
    dateModified?: Date;
}

export class Message {
    private _id?: string;
    userId?: string;
    content?: string;
    dateSent?: Date;
}