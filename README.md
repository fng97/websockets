# WebSocket Client

A WebSocket client written in Zig.

NOTE: This is a work in progress. The client has only been tested against the Autobahn test suite :)

To test against the [Autobahn test suite](https://github.com/crossbario/autobahn-testsuite), run
`zig build test`. You must use Zig 0.14 and have docker installed.

If you have Nix installed and flakes enabled you can run: `nix develop --command zig build test`.
This will build the project and run the test suite (takes about 15s on my machine).

The test results can be viewed by opening `autobahn-testsuite/reports/index.html` in the browser.
All tests not excluded in the configuration (`autobahn-testsuite/fuzzingserver.json`) are passing.
