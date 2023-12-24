import schedule from "node-schedule"
import { CitiesService } from "../services/CitiesService";
import { addQueue } from "../queues";

const job = schedule;

job.scheduleJob('*/60 * * * * *', async () => {
    const cities = await CitiesService.ListOfAllCities();
    cities.map(async (item: any) => {
        // @ts-ignore
        if (item.id <= 100) {           
            await addQueue('heuderdev@gmail.com', item)
        }
    })
})
