import { Router } from "express"
import { signUp, signIn } from "../controllers/sessions.controllers.js"
import { signUpSchema, signInSchema } from "../schemas/sessions.schemas.js"
import { validateSchema } from "../middlewares/validateschema.js"

const sessionsRouter = Router()

sessionsRouter.post("/signup", validateSchema(signUpSchema), signUp)
sessionsRouter.post("/signin", validateSchema(signInSchema), signIn)

export default signRouter