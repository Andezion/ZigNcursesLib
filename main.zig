const std = @import("std");
const term = @import("src/term.zig");

pub fn main() !void {
    try term.clear();
    try term.hideCursor();
    try term.showCursor();

    try term.moveCursor(10, 5);
    try term.setFgColor256(33);
    try term.setBgColor256(226);
    try term.print("i hate lviv.\n", .{});
    try term.reset();

    var b: [1]u8 = undefined;
    const n = try std.fs.File.stdin().read(b[0..]);
    _ = n;
}
