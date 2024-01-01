import { Request, Response } from "express";
import { HistoricalService } from "../services/HistoricalService";
import { Prisma } from "@prisma/client";

export class HistoricalController {
    static async all(request: Request, respose: Response) {
        const historical = await HistoricalService.all()
        return respose.status(historical.status).json(historical)
    }
    static async create(request: Request<any,any,Prisma.HistoricalCreateInput>, respose: Response) { 
        const data = request.body
        const historical = await HistoricalService.create(data)
        return respose.status(historical.status).json(historical)
    }

}