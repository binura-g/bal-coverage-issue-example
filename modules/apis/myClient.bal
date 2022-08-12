import ballerina/log;
import ballerina/http;

final http:Client _myClient = check new ("https://doesnotexist.com.au");

isolated function getMyClient() returns http:Client|error {
    return _myClient;
}

public isolated function proxyRequest(http:Request req) returns json|error {
    string endpoint = string `/api/v1/external-path`;

    var myClient = check getMyClient();
    var res = myClient->forward(endpoint, req, targetType = json);
    log:printInfo("myClient.proxyRequest has been called");
    return res;
}
