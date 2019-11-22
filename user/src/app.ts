import 'dotenv/config';
import express, { Application } from 'express';
import { router as userRouter } from './controllers/user';

const app: Application = express();
const port: string = process.env.USER_PORT || '8000';

app.use(express.json());

/* connect routers */
app.use('/', userRouter);

app.listen(port, () => {
    console.log(`This app is listening on the port ${port}!`);
});
