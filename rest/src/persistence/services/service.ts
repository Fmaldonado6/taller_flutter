import { IService } from './../../core/services/iService';
import { Model } from "mongoose";

export abstract class Service<T extends object> implements IService<T> {

    async add(object: T): Promise<T> {
        return await this.getModel().create(object);
    }

    async get(id: string): Promise<T> {
        let object: T = (await this.getModel().findById(id)).toObject() as T;
        return object;
    }
    async findAll(): Promise<T[]> {
        return (await this.getModel().find()).map(e => e.toObject());
    }
    async update(object: T): Promise<T> {
        const objectAny = object as any;
        const id = objectAny._id
        return await this.getModel().findByIdAndUpdate(id, objectAny) as T;

    }
    async delete(id: string): Promise<T> {
        return await this.getModel().findByIdAndDelete(id);

    }

    abstract getModel(): Model<any>;

}