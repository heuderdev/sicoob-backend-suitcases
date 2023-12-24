import * as yup from "yup"
export const TypeCreateValidation = yup.object().shape({
    name: yup.string().required()
})