import ballerina/io;

public function main() {
    
    // 無名関数の型を明確に指定
    function (string, string) returns string annonFunction = 
        function(string x, string y) returns string {
            return x + y;
        };
    io:println("Output: ", annonFunction("Hello ", "World!!"));

    // 無名関数を var で変数定義。
    var annonFunction2 = function (string x, string y, string...z) returns string {
        string value = x + y;

        foreach var item in z {
            value += item;
        }
        return value;
    };
    io:println("Output: ", annonFunction2("Ballerina ", "is ", "an ", "open ", "source ", "programming", "language"));

    // arrow で Lambda関数っぽく書ける
    function (string, string) returns string arrowExpr = (x, y) => x + y;
    io:println("Output: ", arrowExpr("Hello ", "Arrow"));
}
