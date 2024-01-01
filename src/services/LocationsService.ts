import { Prisma } from "@prisma/client";
import { prismaDatabase } from "../utils/prisma";
import { AppResponse } from "../utils/AppResponse";

export class LocationsService {
    static async all() {
        const location = await prismaDatabase.locations.findMany()
        return AppResponse(false, 201, "Requisição API bem-sucedida", { location })

    }

    static async create(data: Prisma.LocationsCreateInput) {
        const { name } = data;

        try {
            const location =  await prismaDatabase.locations.create({data: { name }})
            return AppResponse(false, 201, "Requisição API bem-sucedida", { location })
        } catch (error) {
            return error
        }
    }

    static async delete(id: number) {
        const location =  await prismaDatabase.locations.delete({ where: { id } })
        return AppResponse(false, 201, "Requisição API bem-sucedida", { location })
    }


    static async update(id: number, name: Prisma.LocationsUpdateInput) {
        const location =  await prismaDatabase.locations.update({ where: { id }, data: { name: String(name) } })
        return AppResponse(false, 201, "Requisição API bem-sucedida", { location })
    }
}