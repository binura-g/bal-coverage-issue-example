import ballerina/test;
import ballerina/http;
import ballerina/log;

http:Client testClient = check new (string `http://localhost:9090`);

@test:Config {groups: ["myClient"]}
function testServiceExample() returns error? {
    var mockMyClient = test:mock(http:Client);
    test:prepare(mockMyClient).when("forward").thenReturnSequence(
        getGenericSuccessPayload(),
        getGenericBadRequestResponse());

    test:when(mock_getMyClient).thenReturn(mockMyClient);

    log:printInfo("running mocked test case - 01 - expecting 200");
    http:Response response = check testClient->get("/api/test");
    test:assertEquals(response.statusCode, 200);

    log:printInfo("running mocked test case - 02 - expecting 400");
    response = check testClient->get("/api/test");
    test:assertEquals(response.statusCode, 400);
}

function getGenericSuccessPayload() returns http:Response {
    http:Response mockResponse = new;
    mockResponse.statusCode = 200;
    json payload = {"data": {}};
    mockResponse.setPayload(payload);
    return mockResponse;
}

function getGenericBadRequestResponse() returns http:Response {
    http:Response mockResponse = new;
    mockResponse.statusCode = 400;
    mockResponse.setPayload({"error": "Bad Request"});
    return mockResponse;
}
