import boto3

client = boto3.client('s3')

try:
    client.upload_file('./app.zip','iaclambda','app.zip')
    print("Application uploaded to bucket")
except Exception as e:
    print(e)
