import { connect } from "mongoose";

class MongodbConnection {

    public async connectDatabase() {
        if (!process.env.DB_CONNECTION)
            throw new Error("No database url specified");

        await connect(process.env.DB_CONNECTION!! as string, {
            useNewUrlParser: true,
            useFindAndModify: false,
            useUnifiedTopology: true
        })

    }

}

export const mongoDbConnection = new MongodbConnection();