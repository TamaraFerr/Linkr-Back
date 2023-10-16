import db from "../database/database.connection.js";
import { createPost } from "../repository/posts.repository.js";


export async function getPosts(req, res) {

    try {
        const twittes = await db.query(`SELECT * FROM posts `)
        res.status(201).send(twittes.rows)

    } catch (err) {
        return res.status(500).send(err.message)
    }

}

export async function postTwittes(req, res) {

    const { url, description } = req.body
    const { userId } = res.locals

    try {

        await createPost(userId, url, description)

        return res.sendStatus(201)

    } catch (err) {
        return res.status(500).send(err.message)
    }

}

export async function getUserPosts(req, res) {

    const { userId } = res.locals

    try {
        const twittes = await db.query(`SELECT * FROM posts WHERE "userId" = $1`, [userId])
        res.status(201).send(twittes.rows)

    } catch (err) {
        return res.status(500).send(err.message)
    }

}