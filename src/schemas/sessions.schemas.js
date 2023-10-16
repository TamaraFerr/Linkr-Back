import Joi from "joi"

export const signUpSchema = Joi.object({
	email: Joi.string().email({ minDomainSegments: 2, tlds: { allow: ['com', 'net'] } }).required(),
    password: Joi.string().required(),
	username: Joi.string().required(),
    pictureurl: Joi.string().uri().required()
})


export const signInSchema = Joi.object({
	email: Joi.string().email({ minDomainSegments: 2, tlds: { allow: ['com', 'net'] } }).required(),
    password: Joi.string().required(),
})
