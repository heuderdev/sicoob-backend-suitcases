import { Router } from "express";
import { SessionControlller } from "../controllers/SessionControlller";
import { LocationController } from "../controllers/LocationController";
import { SuitcaseController } from "../controllers/SuitcaseController";
import { TypeController } from "../controllers/TypeController";
import { VolumeController } from "../controllers/VolumeController";
import { ensureAuthentication } from "../middlewares/ensureAuthentication";

const routes = Router();

routes.post("/v1/session/login", SessionControlller.Login)
routes.post("/v1/session/register", SessionControlller.Register)

routes.get("/v1/location", LocationController.all)
routes.post("/v1/location", ensureAuthentication, LocationController.create)
routes.put("/v1/location/:id", ensureAuthentication, LocationController.update)
routes.delete("/v1/location/:id", ensureAuthentication, LocationController.delete)

routes.get("/v1/suitcase", SuitcaseController.all)
routes.post("/v1/suitcase", ensureAuthentication, SuitcaseController.create)

routes.get("/v1/type", TypeController.all)
routes.post("/v1/type", ensureAuthentication, TypeController.create)

routes.get("/v1/volume", VolumeController.all)
routes.post("/v1/volume", ensureAuthentication, VolumeController.create)

export { routes };
