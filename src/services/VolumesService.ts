import { Prisma, PrismaClient } from "@prisma/client"
import { prismaDatabase } from "../utils/prisma"
import { ICreateVolumesService } from "../interfaces/volumes/ICreateVolumesService"

export class VolumesService {
    static async all() {
        try {
            return await prismaDatabase.volumes.findMany({
                include: {
                    suitcases: {
                        select: {
                            protocol: true
                        }
                    },
                    types: {
                        select: {
                            name: true
                        }
                    }
                }
            })
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

    static async searchCustom(name: string, tipo: number) {

        const volumes = await prismaDatabase.volumes.findFirst({
            select: {
                id: true,
                name: true,
                suitcases: {
                    select: {
                        protocol: true,
                        locations: {
                            select: {
                                name: true,
                            },
                        },
                    },
                },
            },
            where: {
                name: name,
                AND: {
                    suitcases: {
                        locations: {
                            AND: {
                                id: Number(tipo)
                            }
                        }
                    }
                }
            },
        })

        const content = {
            id: volumes?.id,
            name: volumes?.name,
            protocol: volumes?.suitcases.protocol,
            location_name: volumes?.suitcases?.locations.name
        }

        return content
    }
}