def lambda_handler(event, context):
   message = 'Hello world, version 2'
   return {
       'message' : message
   }
