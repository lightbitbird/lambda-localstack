import json

def lambda_handler(event, context):
    return response({'message': 'Hello LocalStack!!'}, 200)

def response(message, status_code):
    return {
        'statusCode': str(status_code),
        'body': json.dumps(message),
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
            },
        }


