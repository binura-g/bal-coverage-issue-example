import ballerina/http;
import test_coverage.apis;

service /api/test on new http:Listener(9090) {
    resource function default [string... paths](http:Request req) returns json|error {
        return apis:proxyRequest(req);
    }
}
