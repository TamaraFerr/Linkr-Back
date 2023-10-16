import db from '../database/database.connection.js';

export async function getUserByEmail(email) {
    return db.query('SELECT * FROM users WHERE "email" = $1', [email]);
}

export async function insertUser(email, password, username, pictureurl) {
    return db.query('INSERT INTO users (email, password, username, pictureurl) VALUES ($1, $2, $3, $4);',
        [email, password, username, pictureurl]);
}

export async function insertSession(userid, token) {
    return db.query('INSERT INTO sessions (userid, token) VALUES ($1, $2);',
        [userid, token]);
}

export async function checkToken(token) {
    return db.query(`SELECT * FROM sessions WHERE token = $1`, [token]);
}

//test