import { PrismaClient } from "@prisma/client";

const prismaDatabase = new PrismaClient({
    log: ['info','query'],
});


export { prismaDatabase };
