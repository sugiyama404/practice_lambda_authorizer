# ファイル名: protected_endpoint/main.py
# ZIP形式で圧縮し、TerraformのLambdaリソースで指定

import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def handler(event, context):
    logger.info(f"Event: {json.dumps(event)}")

    # オーソライザーから渡されたコンテキスト情報にアクセス可能
    principal_id = event.get('requestContext', {}).get('authorizer', {}).get('principalId', 'unknown')

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "message": "認証成功！保護されたリソースにアクセスできました",
            "principalId": principal_id
        })
    }
