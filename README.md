# AWS lambda with Localstack

## Install localstack

### Using pip
```
$ python -m venv venv
$ source venv/bin/activate
$ pip install localstack
$ TMPDIR=/private$TMPDIR localstack start --docker
$ source venv/bin/activate
```

### Using docker-compose
```
$ git clone https://github.com/localstack/localstack.git
$ cd localstack
$ TMPDIR=/private$TMPDIR docker-compose up
```

## Call lambda from AWS CLI
```
$ zip lambda.zip lambda.py
$ aws --endpoint-url=http://localhost:4574 --region us-east-1 --profile localstack lambda create-function --function-name=f1 --runtime=python3.8 --role=r1 --handler=lambda.lambda_handler --zip-file fileb://lambda.zip
$ aws lambda --endpoint-url=http://localhost:4574 invoke --function-name f1 --payload $(echo '{"name1":"Max", "name2":"Peter", "name3":"Katy"}' | base64) result.log
$ cat result.log
```
Open your browser with http://localhost:8080 to see aws resources on the localstack

