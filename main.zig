const std = @import("std");
const term = @import("src/term.zig");

pub fn main() !void {
    try term.clear();
    try term.hideCursor();
    //defer term.showCursor();

    try term.moveCursor(10, 5);
    try term.setFgColor256(33);
    try term.setBgColor256(226);
    try term.print("i hate lviv.\n", .{});
    try term.reset();

    // var stdin = std.io.getStdIn().reader();
    // _ = try stdin.readByte();
}
