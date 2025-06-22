import json
import datetime

def lambda_handler(event, context):
    try:
        ip_address = event.get('requestContext', {}).get('identity', {}).get('sourceIp', 'Unknown')
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
    except Exception as e:
        return {
            'statusCode': 500,
            'headers': { 'Content-Type': 'application/json' },
            'body': json.dumps({ 'error': str(e) })
        }
