import { Prisma } from "@prisma/client";
import { prismaDatabase } from "../utils/prisma";

export class SuitcasesService {
    static async all() {
        console.log("ddassd");
        
        return await prismaDatabase.suitcases.findMany({
            include: {
                locations: { select: { name: true } },
            },
            orderBy:{
                protocol: "asc"
            }
        })
    }

    static async create(protocol: string, locationsId: number) {
        return await prismaDatabase.suitcases.create({ data: { protocol, locationsId } })
    }
}