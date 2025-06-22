import json
import datetime

def lambda_handler(event, context):
    # Fetch the IP from the API Gateway event
    ip_address = event['requestContext']['identity']['sourceIp']

    # Get the current timestamp
    timestamp = datetime.datetime.utcnow().isoformat()

    response = {
        'timestamp': timestamp,
        'ip_address': ip_address
    }

    return {
        'statusCode': 200,
        'headers': { 'Content-Type': 'application/json' },
        'body': json.dumps(response)
    }
