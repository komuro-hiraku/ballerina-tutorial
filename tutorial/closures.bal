import ballerina/io;

int globalA = 5;

function basicClosure() returns (function (int) returns int) {
    int a = 3;

    var foo = function (int b) returns int {
        int c = 34;
        if ( b == 3) {
            c = c + b + a + globalA;    // 34 + 3 + 3 + 5
        }
        return c + a;
    };
    return foo;
}

// 多段に無名関数を定義していき、それぞれローカル変数と入力パラメータを持つ 
function multilevelClosure() returns (function (int) returns int) {
    int a = 2;

    var func1 = function (int x) returns int {
        int b = 23;

        a = a + 8; // 2 + 8
        var func2 = function (int y) returns int {
            int c = 7;

            var func3 = function (int z) returns int {
                b = b + 1; // 24
                return x + y + z + a + b + c; // x + y + z + 10 + 24 + 7
            };
            return func3(8) + y + x; // (x + y) + (8 + 10 + 24 + 7) + (x + y)
        };
        return func2(4) + x; // 2*(x + 4) + (8 + 10 + 24 + 7) + x
    };
    return func1;
}

// これ最高に分かりづらいな・・・・
function functionPointers(int a) returns
                    (function (int) returns (function (int) returns int)) {
                        return function (int b) returns (function (int) returns int) {
                            return function (int c) returns int {
                                return a + b + c;
                            };
                        };
                    }

public function main() {
    
    var foo = basicClosure();
    int result1 = foo(3);
    io:println("Answer: ", result1);


    var bar = multilevelClosure();
    int result2 = bar(5); // // 2*(5 + 4) + (8 + 12 + 24 + 7) + 5
    io:println("Answer: ", result2);

    var baz1 = functionPointers(7);
    var baz2 = baz1(5);
    var result3 = baz2(3);
    io:println("Answer: ", result3);
}

// Next https://ballerina.io/learn/by-example/expression-bodied-functions.html

