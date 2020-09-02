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
}

function toUpper(string value) returns string {
    return value.toUpperAscii();
}