import schedule from "node-schedule"
import { addQueue } from "../queues";

const job = schedule;

job.scheduleJob('*/60 * * * * *', async () => {
   
})
