import { Router } from "express";
import { SessionControlller } from "../controllers/SessionControlller";

const routes = Router();

routes.post("/v1/session/login", SessionControlller.Login)
routes.post("/v1/session/register", SessionControlller.Register)

export { routes };
