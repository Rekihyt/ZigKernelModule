const std = @import("std");

// Not linked to kernel, map printk to print
pub fn printk(str: [*c]const u8) void {
    std.debug.print("{s}", .{ str });
}