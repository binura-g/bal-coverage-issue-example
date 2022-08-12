Example - Parent/Caller functions are not collected in coverage when a child down the call stack is mocked.

1. `bal test --test-report --code-coverage` 

2. Confirm that the function is actually tested by looking at the logs.
```
Running Tests with Coverage

        test_coverage
time = 2022-08-12T11:54:09.456+10:00 level = INFO module = admin/test_coverage$test message = "running mocked test case - 01 - expecting 200"
time = 2022-08-12T11:54:09.661+10:00 level = INFO module = admin/test_coverage$test message = "running mocked test case - 02 - expecting 400"


                1 passing
                0 failing
                0 skipped
```

2. Check the generated test report. `modules/apis/myClient.bal` has 0% coverage even though the function was called.
