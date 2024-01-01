
type ApiResponse<T> = {
    error: boolean;
    status: number;
    message: string;
    body: T;
};


export const AppResponse = <T>(error: boolean, status: number, message: string, body: T): ApiResponse<T> => {
    const validatedMessage: string = typeof message === 'string' ? message : 'Mensagem inválida';

    return {
        error,
        status,
        message:validatedMessage,
        body
    };
};