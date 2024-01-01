import { Prisma } from "@prisma/client"
import { AppResponse } from "../utils/AppResponse"
import { prismaDatabase } from "../utils/prisma"
import { HISTORICAL_CREATE, HISTORICAL_CREATE_ERROR } from "../utils/messages/historical"


export class HistoricalService {
    static async all() {
        const historic = await prismaDatabase.historical.findMany()
        return AppResponse(false, 201, "Parabéns! Seu histórico foi criado com sucesso. Agora, você tem um registro detalhado das suas atividades mais recentes. Fique à vontade para explorar e utilizar essas informações para otimizar sua experiência. Caso tenha alguma dúvida ou precise de assistência adicional, nossa equipe de suporte está pronta para ajudar. Agradecemos por escolher nosso serviço!", { historic })

    }

    static async create(data: Prisma.HistoricalCreateInput) {
        try {
            const historic = await prismaDatabase.historical.create({ data })
            return AppResponse(false, 201, HISTORICAL_CREATE, { historic })
        } catch (error) {
            return AppResponse(true, 401, HISTORICAL_CREATE_ERROR, {  })
        }
    }

}