const std = @import("std");

pub fn clear() !void {
    try std.fs.File.stdout().writeAll("\x1b[2J\x1b[H", .{});
}

pub fn moveCursor(x: usize, y: usize) !void {
    const out = std.io.getStdOut().writer();
    try out.print("\x1b[{d};{d}H", .{ y, x });
}

pub fn setFgColor256(n: u8) !void {
    const out = std.io.getStdOut().writer();
    try out.print("\x1b[38;5;{d}m", .{n});
}

pub fn setBgColor256(n: u8) !void {
    const out = std.io.getStdOut().writer();
    try out.print("\x1b[48;5;{d}m", .{n});
}

pub fn reset() !void {
    const out = std.io.getStdOut().writer();
    try out.print("\x1b[0m", .{});
}

pub fn hideCursor() !void {
    const out = std.io.getStdOut().writer();
    try out.print("\x1b[?25l", .{});
}

pub fn showCursor() !void {
    const out = std.io.getStdOut().writer();
    try out.print("\x1b[?25h", .{});
}

pub fn print(comptime fmt: []const u8, args: anytype) !void {
    const out = std.io.getStdOut().writer();
    try out.print(fmt, args);
}
