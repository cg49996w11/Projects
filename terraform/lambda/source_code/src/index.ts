import { Handler } from 'aws-lambda'

export const handler : Handler = async (event) => {
  const responseMessage = `Hello World 2`

  return ({
    statusCode: 200,
    headers: {
      'Content-Type': 'application/json',
    },
    body: {
      message: responseMessage,
    },
  })
} 