import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('smartlistdynamo2023-dev')

def lambda_handler(event, context):
    http_method = event['httpMethod']
    body = json.loads(event['body'])
    
    if http_method == 'POST':
        # Create a new item
        response = table.put_item(Item=body)
        return {
            'statusCode': 201,
            'body': json.dumps('Item created successfully')
        }
    elif http_method == 'GET':
        # Retrieve an item
        item_id = event['queryStringParameters']['id']
        response = table.get_item(Key={'id': item_id})
        if 'Item' in response:
            return {
                'statusCode': 200,
                'body': json.dumps(response['Item'])
            }
        else:
            return {
                'statusCode': 404,
                'body': json.dumps('Item not found')
            }
    elif http_method == 'PUT':
        # Update an item
        item_id = body['id']
        response = table.put_item(Item=body)
        return {
            'statusCode': 200,
            'body': json.dumps('Item updated successfully')
        }
    elif http_method == 'DELETE':
        # Delete an item
        item_id = event['queryStringParameters']['id']
        response = table.delete_item(Key={'id': item_id})
        return {
            'statusCode': 200,
            'body': json.dumps('Item deleted successfully')
        }
    else:
        return {
            'statusCode': 400,
            'body': json.dumps('Invalid HTTP method')
        }
