import { Request, Response } from "express";
import { VolumesService } from "../services/VolumesService";
import { ICreateVolumesController } from "../interfaces/volumes/ICreateVolumesController";

export class VolumeController {
    static async all(request: Request, response: Response) {
        try {
            return response.json(await VolumesService.all())
        } catch (error) {
            return response.status(400).json(error)
        }
    }

    static async create(request: Request<any, any, ICreateVolumesController>, response: Response) {
        const { name, suitcasesId, typesId } = request.body
        
        try {
            return response.json(await VolumesService.create({ name, suitcasesId, typesId }))
        } catch (error) {
            return response.status(400).json(error)
        }
    }

    static async searchCustom(request: Request<any, any, { name: string, tipo: number }>, response: Response) {
        const { name, tipo } = request.body
        const content = await VolumesService.searchCustom(name, tipo)
        console.log(content);
        
        return response.json(content)
    }
}