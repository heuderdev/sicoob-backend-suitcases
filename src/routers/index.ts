import { Router } from "express";
import { SessionControlller } from "../controllers/SessionControlller";
import { LocationController } from "../controllers/LocationController";
import { SuitcaseController } from "../controllers/SuitcaseController";
import { TypeController } from "../controllers/TypeController";
import { VolumeController } from "../controllers/VolumeController";

const routes = Router();

routes.post("/v1/session/login", SessionControlller.Login)
routes.post("/v1/session/register", SessionControlller.Register)

routes.get("/v1/location", LocationController.all)
routes.post("/v1/location", LocationController.create)
routes.put("/v1/location/:id", LocationController.update)
routes.delete("/v1/location/:id", LocationController.delete)

routes.get("/v1/suitcase", SuitcaseController.all)
routes.post("/v1/suitcase", SuitcaseController.create)

routes.get("/v1/type", TypeController.all)
routes.post("/v1/type", TypeController.create)

routes.get("/v1/volume", VolumeController.all)
routes.post("/v1/volume", VolumeController.create)

export { routes };
