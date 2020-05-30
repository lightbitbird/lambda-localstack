from collections import OrderedDict

def lambda_handler(event, context):
    response = OrderedDict()
    keys = sorted(event)
    i=1
    for k in keys:
        response['res' + str(i)] = 'Hello, ' + event[k]
        i += 1

    return response

