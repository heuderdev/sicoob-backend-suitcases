import { Request, Response } from "express";

export class VerifyTokenController {
    static async verify(request: Request, response: Response) {
        const user = request.user ? true : false
        return response.json(user)
    }
}