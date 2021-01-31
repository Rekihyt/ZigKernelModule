// const std = @import("std");
// usingnamespace @import("c.zig");

extern fn printk([*c]const u8) void;

export fn init_hellokernel() callconv(.C) c_int {
    printk("Hello kernel!\n");
    return 0;
}

export fn exit_hellokernel() callconv(.C) void {
    printk("Goodbye kernel!\n");
}

// pub fn main() anyerror!void {

    // var init_command = &[_]u8{
    //     0xAE, 0xA8, 0x3F, 0xD3, 0x00, 0x40, 0xA1, 0xC8,
    //     //0xA6, 0xD5, 0x80, 0xDA, 0x12, 0x81, 0x00, 0xB0,
    //     0xA6, 0xD5, 0x80, 0xDA, 0x12, 0x81, 0xFF,
    //     0xA4, 0xDB, 0x40, 0x20, 0x00, 0x00, 0x10, 0x8D,
        // 0x14, 0x2E, 0xA6, 0xAF
    // };
    // _ = initDisplay();
    
    // std.log.info("All your kernel are belong to us.", .{ });
// }
