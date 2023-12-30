import 'dotenv/config'
import express from "express";
import expressSession from "express-session";
import bodyParser from "body-parser";
import cors from "cors";
import { routes } from "./routers";
import errorHandler from "./middlewares/errorHandler";

import './utils/schedule';

const PORT = Number(process.env.PORT)

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json());

app.use(cors());

app.use(errorHandler);

app.use(routes);

app.listen(PORT, '0.0.0.0', () => console.log(`server running on port ${PORT}`));