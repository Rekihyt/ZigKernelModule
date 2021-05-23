const std = @import("std");

// Switch based on tag, as using target / mode is trickier
// without full std lib access.
usingnamespace @import(
    if (std.builtin.os.tag == .freestanding) "kernel.zig"
    else "debug.zig"
);

export fn init_hellokernel() callconv(.C) c_int {
    printk("Hello kernel!\n");
    return 0;
}

export fn exit_hellokernel() callconv(.C) void {
    printk("Goodbye kernel!\n");
}

test "test1" {
    printk("Hello stdout \"kernel\"!\n");
}