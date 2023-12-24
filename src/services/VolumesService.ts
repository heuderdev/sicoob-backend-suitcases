import { Prisma, PrismaClient } from "@prisma/client"
import { prismaDatabase } from "../utils/prisma"
import { ICreateVolumesService } from "../interfaces/volumes/ICreateVolumesService"

export class VolumesService {
    static async all() {
        try {
            return await prismaDatabase.volumes.findMany()
        } catch (error) {
            return error
        }
    }


    static async create({ name, suitcasesId, typesId }: ICreateVolumesService) {
        try {
            return await prismaDatabase.volumes.create({ data: { name, typesId, suitcasesId } })
        } catch (error) {
            return error
        }
    }
}