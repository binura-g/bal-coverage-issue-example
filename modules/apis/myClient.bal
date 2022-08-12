import ballerina/http;

final http:Client _myClient = check new ("http://invalid-url.com");

isolated function getMyClient() returns http:Client|error {
  return _myClient;
}

public isolated function proxyRequest(http:Request req) returns json|error {
    string endpoint = string `/api/v1/external-path`;

    var myClient = check getMyClient();
    return myClient->forward(endpoint, req, targetType = json);
}
