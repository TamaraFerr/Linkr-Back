import { Router } from "express";
import { getPosts, postTwittes } from "../controllers/posts.controllers.js";
import { validateAuth } from "../middlewares/validateAuth.middlewares.js";
import { validateSchema } from "../middlewares/validateschema.js";
import { postSchema } from "../schemas/post.schemas.js";




const postsRouter = Router()

postsRouter.get('/timeline', validateAuth, getPosts)
postsRouter.post('/timeline', validateSchema(postSchema),validateAuth, postTwittes)


export default postsRouter