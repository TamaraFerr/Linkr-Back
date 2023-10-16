import db from "../database/database.connection.js"


export async function createPost(userId, url, description) {

    return (
        db.query(`
        INSERT INTO posts ("userId", link, description)
        VALUES ($1,$2,$3);
        `, [userId, url, description])

    )

}
