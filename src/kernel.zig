const std = @import("std");

extern fn printk([*c]const u8) void;

/// Formats the argument, then calls printk.
pub fn print(comptime fmt: []const u8, args: anytype) void {
    printk(std.fmt.comptimePrint(fmt, args));
}