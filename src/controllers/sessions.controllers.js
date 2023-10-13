import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';
import { getUserByEmail, insertSession, insertUser } from '../repository/sessions.repository.js';

export async function signUp(req, res) {

    const { email, password, confirmPassword, username } = req.body;

    const checkEmail = await getUserByEmail(email);
    if (checkEmail.rowCount > 0) return res.status(409).send("Email já cadastrado");
    if (password !== confirmPassword) return res.status(422).send("Senhas e confirmação não conferem");

    const passwordCrypt = bcrypt.hashSync(password, 10);

    try {

        await insertUser(email, passwordCrypt, username);
        return res.status(201).send("Usuário cadastrado com sucesso");

    } catch (err) {
        return res.status(500).send(err.message);
    }

}

export async function signIn(req, res) {

    const { email, password } = req.body;

    const checkUser = await getUserByEmail(email);
    if (checkUser.rowCount <= 0) return res.status(401).send("Email não cadastrado");

    const passwordCheck = bcrypt.compareSync(password, checkUser.rows[0].password);
    if (!passwordCheck) return res.status(401).send("Senha incorreta");

    const token = uuid();
    const data = {
        token: token
    }

    const userId = checkUser.rows[0].id;
    

    try {

        await insertSession(userId, token);


        return res.status(200).send(data);

    } catch (err) {
        return res.status(500).send(err.message);
    }

}