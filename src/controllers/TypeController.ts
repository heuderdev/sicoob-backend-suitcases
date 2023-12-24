import { Request, Response } from "express";
import { TypesService } from "../services/TypesService";
import { Prisma } from "@prisma/client";

export class TypeController {
    static async all(request: Request, response: Response) {
        return response.json(await TypesService.all())
    }

    static async create(request: Request<any, any, Prisma.TypesCreateInput>, response: Response) {
        try {
            const { name } = request.body
            return response.json(await TypesService.create({ name }))
        } catch (error) {
            return response.json(error)
        }
    }
}