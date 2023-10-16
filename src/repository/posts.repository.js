import db from "../database/database.connection.js"


export async function allPost() {
    return (
        db.query(`
            SELECT
                users.name AS "username",
                users.photo,
                posts.link,
                posts.description,
                posts.likes
            FROM posts
            JOIN users ON users.id = posts."userId";`)
    )
}

export async function getUser(userId){
    return(

        db.query(`SELECT * FROM users WHERE id = $1`,[userId])
    )
           
}

export async function createPost(userId, url, description) {

    return (
        db.query(`
        INSERT INTO posts ("userId", link, description)
        VALUES ($1,$2,$3);
        `, [userId, url, description])
    )

}

export async function userPosts(userId) {
    return (
        db.query(`
            SELECT
                users.name AS "username",
                users.photo,
                posts.link,
                posts.description,
                posts.likes
            FROM posts
            JOIN users ON users.id = posts."userId"
            WHERE "userId" = $1;
        ;`, [userId])
    )
}