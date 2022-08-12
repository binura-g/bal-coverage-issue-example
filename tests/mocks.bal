import ballerina/test;

@test:Mock {
    moduleName: "test_coverage.apis",
    functionName: "getMyClient"
}
test:MockFunction mock_getMyClient = new ();
