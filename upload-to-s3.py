import boto3

client = boto3.client('s3')

try:
    client.upload_file('./restapp.zip','iaclambda','restapp.zip')
    print("Application uploaded to bucket")
except Exception as e:
    print(e)
