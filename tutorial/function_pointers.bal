import ballerina/io;
import ballerina/lang.'int;

function test(string s, int ... x) returns float {
    int|error y = 'int:fromString(s); // s を int にパース。失敗したら y は error になる
    float f = 0.0;

    if (y is int) {
        foreach var item in x {
            f += item * 1.0 * y;    // x を Loop して y を float 変換して積
        }
    } else {
        panic y;    // error だったら Abort
    }
    return f;
}

function foo(int x, function (string, int...) returns float bar) returns float {
    return x * bar("2", 2, 3, 4, 5);    // bar = function (string, int ...) returns float
}

# `getFunctionPointer()` function
# + return - The `test()` function
function getFunctionPointer() returns (function (string, int...) returns float) {
    return test;
}

public function main() {
    
    io:println("Answer: ", foo(10, test));
    io:println("Answer: ", foo(10, getFunctionPointer()));

    function (string, int...) returns float f = getFunctionPointer();
    io:println("Answer: ", foo(10, f));
}