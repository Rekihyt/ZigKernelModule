const std = @import("std");

usingnamespace @import(
    if (@hasDecl(@This(), "MY_MODULE")) "kernel.zig"
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