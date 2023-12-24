import { Request, Response } from "express";
import { CitiesService } from "../services/CitiesService";
import { addQueue } from "../queues";

export class CitieController {
  static async ListOfAllCities(request: Request, response: Response) {
    const cities = await CitiesService.ListOfAllCities();
    cities.map(async (item) => {
      // @ts-ignore
      if(item.id <= 500) {
        await addQueue('heuderdev@gmail.com',item)
      }
    })
    return response.status(200).json(cities);
  }
}
