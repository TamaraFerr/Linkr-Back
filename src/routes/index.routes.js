import { Router } from "express"
import sessionsRouter from "./sessions.routes.js"


const router = Router()

router.use(sessionsRouter)


export default router