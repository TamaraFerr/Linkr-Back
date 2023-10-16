import db from "../database/database.connection.js";
import { allPost, createPost, getUser, userPosts } from "../repository/posts.repository.js";


export async function getPosts(req, res) {

    const { userId } = res.locals

    try {

        const user = await getUser(userId)
        const twittes = await allPost()

        res.status(201).send({ name: user.rows[0].name, photo: user.rows[0].photo, twittes: twittes.rows })

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
        const twittesUser = await userPosts(userId)
        res.status(201).send(twittesUser.rows)

    } catch (err) {
        return res.status(500).send(err.message)
    }

}