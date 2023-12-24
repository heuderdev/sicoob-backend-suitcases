import { Request, Response } from "express";
import { SessionService } from "../services/SessionService";
import { Prisma } from "@prisma/client";

export class SessionControlller {
    static async Login(request: Request, response: Response) {
        try {
            const { username, password } = request.body;

            const sessionService = await SessionService.Login(username, password)

            return response.status(201).json(sessionService)
        } catch (error) {
            return response.status(400).json(error)
        }
    }

    static async Register(request: Request<any, any, Prisma.UsersCreateArgs>, response: Response) {
        let status: number = 200
        try {
            const data = request.body.data;
            const sessionService = await SessionService.Register(data)
            status = sessionService.status
            return response.status(status).json(sessionService)
        } catch (error) {
            return response.status(status).json(error)
        }
    }
}