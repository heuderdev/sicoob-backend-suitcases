import { Prisma } from "@prisma/client";
import { prismaDatabase } from "../utils/prisma";
import { validatorObject } from "../utils/yup/location.validation";
import { TypeCreateValidation } from "./validations/type/TypeCreateValidation";

export class TypesService {
    static async all() {
        return await prismaDatabase.types.findMany()
    }

    static async create(data: Prisma.TypesCreateInput) {
        const { name } = data
        await validatorObject(TypeCreateValidation, { name })
        try {
            return await prismaDatabase.types.create({ data: { name } })
        } catch (error) {
            return error
        }
    }
}