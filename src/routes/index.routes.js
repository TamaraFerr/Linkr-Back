import { Router } from "express"
import sessionsRouter from "./sessions.routes.js"
import postsRouter from "./posts.routes.js"


const router = Router()

router.use(sessionsRouter)
router.use(postsRouter)


export default router