import { checkToken } from "../repository/sessions.repository.js"


export async function validateAuth(req, res, next) {
    
    const { authorization } = req.headers
    const token = authorization?.replace("Bearer ", "")
    if (!token) return res.status(401).send("O token passado não exsite")

    try {
        const session = await checkToken(token)
        if (session.rowCount === 0) return res.sendStatus(401)

        

        res.locals.userId = session.rows[0].userId

        next()
    } catch (err) {
        
        res.status(500).send(err.message)
    }
}