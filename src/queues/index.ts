import bull, { Queue } from "bull"
import { prismaDatabase } from "../utils/prisma"

const queueOptions = {
    redis: {
        port: 6379,
        host: '192.168.0.111'
    }
}

export const configQueue = new bull('queuenodejs',queueOptions)

export const addQueue = async (email:string,dados: any) => {
   return await configQueue.add({email, dados})
}

configQueue.process(async job => {
    await realizarTrabalhoDemorado();
})

configQueue.on('completed', async (job, result) => {
    // console.log(`Tarefa ${job.id} concluída. Resultado:`, (job.data));
    await prismaDatabase.logs.create({
        data: {
            name_json: JSON.stringify(job)
        }
    })
});


configQueue.on('failed', (job, err) => {
    console.log(`Tarefa ${job.id} falhou. Erro:`, err);
});



const realizarTrabalhoDemorado = async () => {
    return new Promise(resolve => {
        setTimeout(resolve, 50);
    });
};