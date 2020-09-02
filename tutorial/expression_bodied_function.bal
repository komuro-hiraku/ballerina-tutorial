
import ballerina/io;

// 書き方がLambda式っぽい
function add(int a, int b) returns int => a + b;

public function main() {
    int sum = add(10, 20);
    io:println(sum);

    var toEmployee = function (Person p, string pos) returns Employee => {
        name: p.firstName + " " + p.lastName,
        designation: pos
    };

    Person john = { firstName: "John", lastName: "Smith", age: 30};
    Employee johnEmployee = toEmployee(john, "AI Expert");

    io:println(johnEmployee);
}

// record type
type Person record {
    string firstName;
    string lastName;
    int age;
};

type Employee record {
    string name;
    string designation;
};

