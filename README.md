# Issue
If an object down the call stack is mocked, it doesn't seem to collect any coverage from the immediate parent function.

Running windows 11 - cmd
```
$ bal version

Ballerina 2201.1.1 (Swan Lake Update 1)
Language specification 2022R2
Update Tool 1.3.9
```

# To reproduce

1. `bal test --test-report --code-coverage` 

2. Confirm that the function is actually tested by looking at the logs.
```log
Running Tests with Coverage

        test_coverage
time = 2022-08-12T12:28:06.870+10:00 level = INFO module = admin/test_coverage$test message = "running mocked test case - 01 - expecting 200"
time = 2022-08-12T12:28:07.062+10:00 level = INFO module = admin/test_coverage.apis message = "myClient.proxyRequest has been called"
time = 2022-08-12T12:28:07.093+10:00 level = INFO module = admin/test_coverage$test message = "running mocked test case - 02 - expecting 400"
time = 2022-08-12T12:28:07.104+10:00 level = INFO module = admin/test_coverage.apis message = "myClient.proxyRequest has been called"


                1 passing
                0 failing
                0 skipped
```

2. Check the generated test report. `modules/apis/myClient.bal` has 0% coverage even though the function was called.
