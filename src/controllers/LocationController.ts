import { Request, Response } from "express";
import { LocationsService } from "../services/LocationsService";
import { Prisma } from "@prisma/client";

export class LocationController {
    static async all(request: Request, response: Response) {
        const locations = await LocationsService.all()
        return response.json(locations)
    }

    static async create(request: Request<any, any, Prisma.LocationsCreateInput>, response: Response) {
        const locations = await LocationsService.create(request.body)
        return response.json(locations)
    }

    static async update(request: Request, response: Response) {
        const { name } = request.body
        const { id } = request.params;
        const locations = await LocationsService.update(Number(id), name)
        return response.json(locations)
    }

    static async delete(request: Request, response: Response) {
        const { id } = request.params;

        const locations = await LocationsService.delete(Number(id))
        return response.json(locations)
    }
}