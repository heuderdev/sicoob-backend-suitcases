
import * as yup from "yup"
export const RegisterValidation = yup.object().shape({
    username: yup.string().required(),
    email: yup.string().email().required(),
    password: yup.string().required(),
})