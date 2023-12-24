import { Request, Response } from "express";
import { SuitcasesService } from "../services/SuitcasesService";

export class SuitcaseController {
    static async all(request: Request, response: Response) {
        const suitcase = await SuitcasesService.all();
        return response.json(suitcase)
    }

    static async create(request: Request, response: Response) {
        const { protocol, locationsId } = request.body
        const suitcase = await SuitcasesService.create(protocol, locationsId);
        return response.json(suitcase)
    }
}