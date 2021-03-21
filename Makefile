DOCKER_COMPOSE=docker-compose
ENDPOINT_URL=http://localhost:4574


up:
	${DOCKER_COMPOSE} up


down:
	${DOCKER_COMPOSE} down


zip:
	zip lambda.zip lambda.py


setup: zip
	aws --endpoint-url=${ENDPOINT_URL} \
        lambda create-function \
        --region us-east-1 --profile localstack \
        --function-name=f1 --runtime=python3.8 \
        --role=r1 --handler=lambda.lambda_handler \
        --zip-file fileb://lambda.zip


update: zip
	aws --endpoint-url=${ENDPOINT_URL} \
        lambda update-function-code \
        --region us-east-1 --profile localstack \
        --function-name=f1 \
        --zip-file fileb://lambda.zip


invoke:
	aws lambda --endpoint-url=${ENDPOINT_URL} invoke \
    --function-name f1 \
    --payload `(echo '{"name1":"Max", "name2":"Peter", "name3":"Katy"}' | base64)` result.log

