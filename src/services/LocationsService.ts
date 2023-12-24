import { Prisma } from "@prisma/client";
import { prismaDatabase } from "../utils/prisma";

export class LocationsService {
    static async all() {
        return await prismaDatabase.locations.findMany()
    }

    static async create(data: Prisma.LocationsCreateInput) {
        const { name } = data;

        try {
            return await prismaDatabase.locations.create({
                data: {
                    name
                }
            })
        } catch (error) {
            return error
        }
    }

    static async delete(id: number) {
        return await prismaDatabase.locations.delete({ where: { id } })
    }


    static async update(id: number, name: Prisma.LocationsUpdateInput) {
        return await prismaDatabase.locations.update({ where: { id }, data: { name: String(name) } })
    }
}