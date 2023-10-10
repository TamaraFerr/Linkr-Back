import db from '../database/database.connection.js';

export async function getUserByEmail (email) {
	return db.query('SELECT * FROM users WHERE "email" = $1', [email]);
}

export async function insertUser (email, password, username) {
	return db.query('INSERT INTO users (email, password, username) VALUES ($1, $2, $3);', 
    [email, password, username, phone]);
}

export async function insertSession (userId, token, state) {
	return db.query('INSERT INTO sessions (userid, token, state) VALUES ($1, $2, $3);', 
    [userId, token, state]);
}

export async function checkToken (token, id) {
    return db.query(`SELECT * FROM sessions WHERE token = $1 AND userid = $2;`, [token, id]);
}