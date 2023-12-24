import { Prisma } from "@prisma/client";
import { genSaltSync, hashSync, compareSync } from "bcryptjs"
import { prismaDatabase } from "../utils/prisma";
import { AppError } from "../utils/AppError";
import { validatorObject } from "../utils/yup/location.validation";
import { RegisterValidation } from "./validations/session/RegisterValidation";
import { sign } from "jsonwebtoken";
export class SessionService {
    static async Login(username: string, password: string) {
        try {
            const user = await prismaDatabase.users.findFirstOrThrow({ where: { username } })

            const passwordMatched = compareSync(password, user?.password);

            if (!passwordMatched) {
                return {
                    status: 400,
                    error: true,
                    message: "usuário ou senha incorretos.",
                    data: []
                };
            }

            // @ts-ignore
            delete user?.password;
            const token = sign({ user: JSON.stringify(user.id) }, String(process.env.JWT_KEY), { expiresIn: '7d' })
            return {
                status: 201,
                error: false,
                message: "Requisição API bem-sucedida!",
                data: {
                    token,
                    user: user,
                }
            };
        } catch (error) {
            return {
                status: 400,
                error: error,
                message: error,
                data: []
            }
        }
    }

    static async Register(data: Prisma.UsersCreateInput) {
        const { username, email, password } = data
        const object = await validatorObject(RegisterValidation, { username, email, password })
        console.log(object);

        const salt = genSaltSync(10);
        const passwordHash = hashSync(password, salt);

        try {
            const createdUser = await prismaDatabase.users.create({
                data: {
                    username,
                    email,
                    password: passwordHash
                }
            })

            return {
                status: 201,
                error: false,
                message: "",
                data: createdUser
            };
        } catch (error) {
            return {
                status: 400,
                error: error,
                message: "",
                data: []
            }
        }
    }
}