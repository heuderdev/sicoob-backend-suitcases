import { Request, Response } from "express";
import { SessionService } from "../services/SessionService";
import { Prisma } from "@prisma/client";

export class SessionControlller {
    static async Login(request: Request, response: Response) {
        let status = 200
        try {
            const { username, password } = request.body;

            const sessionService = await SessionService.Login(username, password)
            status = sessionService.status
            return response.status(status).json(sessionService)
        } catch (error) {
            return response.status(status).json(error)
        }
    }

    static async Register(request: Request<any, any, Prisma.UsersCreateInput>, response: Response) {
        let status: number = 200
        try {
            const data = request.body;
            const sessionService = await SessionService.Register(data)
            status = sessionService.status
            return response.status(status).json(sessionService)
        } catch (error) {
            return response.status(status).json(error)
        }
    }
}