import { Prisma } from "@prisma/client";
import { prismaDatabase } from "../utils/prisma";

export class SuitcasesService {
    static async all() {
        return await prismaDatabase.suitcases.findMany()
    }

    static async create(protocol: string, locationsId: number) {
        console.log(protocol, locationsId);
        
        return await prismaDatabase.suitcases.create({ data: { protocol, locationsId } })
    }
}