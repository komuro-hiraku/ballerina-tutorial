import ballerina/http;
import ballerina/io;

public function main() {
    http:Client clientEP = new ("http://www.mocky.io");
    var resp = clientEP->get("/v2/5ae082123200006b00510c3d/");

    if (resp is http:Response) {
        var payload = resp.getTextPayload();
        if (payload is string) {
            // stringの場合はそのまま表示
            io:println(payload);
        } else {
            // それ以外の場合は detail() を表示
            // error がマッピングされてる
            io:println(payload.detail());
        }
    } else {
        // http:Responseでなければ response の detail() を表示
        // error がマッピングされてる
        io:println(resp.detail());
    }
}
