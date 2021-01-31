extern fn printk([*c]const u8) void;

export fn init_hellokernel() callconv(.C) c_int {
    printk("Hello kernel!\n");
    return 0;
}

export fn exit_hellokernel() callconv(.C) void {
    printk("Goodbye kernel!\n");
}
