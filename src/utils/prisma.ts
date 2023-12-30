import { PrismaClient } from "@prisma/client";

const prismaDatabase = new PrismaClient({
    
});

// prismaDatabase.$disconnect()

export { prismaDatabase };
