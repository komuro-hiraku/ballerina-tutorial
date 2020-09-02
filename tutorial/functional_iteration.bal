import ballerina/io;

public function main() {
    
    map<string> words = {
        a: "ant",
        b: "beer",
        c: "cat",
        d: "dog",
        e: "elephant"
    };

    io:println("Number of elements in 'words': ", words.length());

    // map
    map<string> animals = words.map(toUpper);
    // その場でfunction定義
    map<string> lower = words.map(function (string v) returns string {return v.toLowerAscii();});
    io:println(animals);
    io:println(lower);

    // filter
    int[] numbers = [-5, -3, 2, 7, 12];
    int[] positive = numbers.filter(function (int i) returns boolean {
        return i >= 0;  // 正の値のみfilter
    });
    io:println(positive);

    // foreach
    numbers.forEach(function (int i) {
        io:println("number: ", i);
    });

    // reduce
    int total = numbers.reduce(sum, 0);
    io:println("Total: ", total);

    int totalWithInitialValue = numbers.reduce(sum, 5);
    io:println("Total with Initial Value: ", totalWithInitialValue);

    io:println("\nExecution Order: -");

    // json, map, forEach
    map<json> obj = {name: "apple", colors: ["red", "green"], price: 5};
    obj.map(function (json value) returns string {
        string result = value.toString();
        io:println("- map operation's value: ", result);
        return result.toUpperAscii();   // To Change UpperCase
    }).forEach(function (string s) {
        io:println("-- foreach operation's value: ", s);
    });
    // map 結果を変数に Assign しないとコンパイラに怒られる。使わなければ当然無意味な演算だから妥当

}

# `sum` function
# + acc - field of Accumulator
# + current - field of Current Value
# + return - result of sum calculation
function sum(int acc, int current) returns int {
    return acc + current;
}

# `toUpper` 入力した文字列を大文字に変換して返却する function
# + value - 大文字に変換したい文字列
# + return - 変換後の文字列
function toUpper(string value) returns string {
    return value.toUpperAscii();
}
