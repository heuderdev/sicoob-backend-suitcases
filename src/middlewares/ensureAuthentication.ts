import { Request, Response, NextFunction } from "express"
import { verify } from "jsonwebtoken"
import { compareSync } from "bcryptjs"

export const ensureAuthentication = async (request: Request, response: Response, next: NextFunction) => {
    try {
        const authHeader = request.headers?.authorization;
        if (!authHeader) {
            response.json(401).json({ error: true, message: "JWT inválido." })
        }

        // @ts-ignore
        const [, token] = authHeader?.split(" ");


        if (!token) {
            response.json(401).json({ error: true, message: "JWT inválido." })
        }

        const data = verify(token, String(process.env.JWT_KEY)) as any

        if (data.user) {
            request.user = JSON.parse(data.user) as any
            return next()
        } else {
            return response.json(401).json({ error: true, message: "JWT inválido." })
        }

    } catch (error) {

    }
}