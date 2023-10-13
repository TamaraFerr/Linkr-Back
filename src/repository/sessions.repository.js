import db from '../database/database.connection.js';

export async function getUserByEmail(email) {
    return db.query('SELECT * FROM users WHERE "email" = $1', [email]);
}

export async function insertUser(email, password, username) {
    return db.query('INSERT INTO users (email, password, name) VALUES ($1, $2, $3);',
        [email, password, username]);
}

export async function insertSession(userId, token) {
    return db.query('INSERT INTO sessions ("userId", token) VALUES ($1, $2);',
        [userId, token]);
}

export async function checkToken(token) {
    return db.query(`SELECT * FROM sessions WHERE token = $1`, [token]);
}