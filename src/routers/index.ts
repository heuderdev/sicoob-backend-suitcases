import {Router} from "express";
import { CitieController } from "../controllers/CitieController";

const routes = Router();

routes.get("/v1/cities", CitieController.ListOfAllCities);

export { routes };
