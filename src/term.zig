const std = @import("std");

pub fn clear() !void {
    try std.fs.File.stdout().writeAll("\x1b[2J\x1b[H", .{});
}

pub fn moveCursor(x: usize, y: usize) !void {
    try std.fs.File.stdout().writeAll("\x1b[{d};{d}H", .{ y, x });
}

pub fn setFgColor256(n: u8) !void {
    try std.fs.File.stdout().writeAll("\x1b[38;5;{d}m", .{n});
}

pub fn setBgColor256(n: u8) !void {
    try std.fs.File.stdout().writeAll("\x1b[48;5;{d}m", .{n});
}

pub fn reset() !void {
    try std.fs.File.stdout().writeAll("\x1b[0m", .{});
}

pub fn hideCursor() !void {
    try std.fs.File.stdout().writeAll("\x1b[?25l", .{});
}

pub fn showCursor() !void {
    try std.fs.File.stdout().writeAll("\x1b[?25h", .{});
}

pub fn print(comptime fmt: []const u8, args: anytype) !void {
    try std.fs.File.stdout().writeAll(fmt, args);
}
