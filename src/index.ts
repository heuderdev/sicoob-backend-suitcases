import 'dotenv/config'
import express from "express";
import cors from "cors";
import { routes } from "./routers";
import errorHandler from "./middlewares/errorHandler";

import './utils/schedule';

const PORT =  Number(process.env.PORT)

const app = express();

app.use(cors());
app.use(express.json());

app.use(errorHandler);

app.use(routes);

app.listen(PORT, '0.0.0.0', () => console.log(`server running on port ${PORT}`));