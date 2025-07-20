//! By convention, root.zig is the root source file when making a library. If
//! you are making an executable, the convention is to delete this file and
//! start with main.zig instead.
const std = @import("std");
const testing = std.testing;

pub export fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub export fn sub(a: i32, b: i32) i32 {
    return a - b;
}

pub export fn mul(a: i32, b: i32) i32 {
    var counter: i32 = 0;
    var result: i32 = 0;
    while (counter < b) {
        result = add(result, a);    
        counter = add(counter, 1);
    }
    return result;
}

pub export fn div(a: i32, b: i32) i32 {
    var remainder: i32 = a;
    var quotient: i32 = 0;
    while (remainder >= b) {
        remainder = sub(remainder, b);
        quotient = add(quotient, 1);
    }
    return quotient;
}

test "basic add functionality" {
    try testing.expect(add(3, 7) == 10);
}

test "basic sub functionality" {
    try testing.expect(sub(100, 21) == 79);
}

test "basic mul functionality" {
    try testing.expect(mul(13, 13) == 169);
}

test "basic div functionality" {
    try testing.expect(div(19, 4) == 4);
}
