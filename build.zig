const std = @import("std");
const Builder = std.build.Builder;
const Target = @import("std").Target;
const CrossTarget = std.zig.CrossTarget;
const CpuModel = CrossTarget.CpuModel;
const builtin = @import("builtin");

pub fn build(b: *Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    // const mode = b.standardReleaseOptions();

    const obj = b.addObject("pms", "src/pms.zig");
    // obj.setTarget(
    //     CrossTarget.parse(.{
    //         .arch_os_abi = "aarch64-linux-musleabihf",
    //         .cpu_features = "cortex_a53",

    //     }) catch unreachable
    // );
    const mode = b.standardReleaseOptions();
    obj.setBuildMode(mode);
    // obj.addIncludeDir("src");
    // obj.addObjectFile("wiringPi/lib/libwiringPi.so");
    // obj.addIncludeDir("wiringPi/include");
    obj.addIncludeDir("include");
    // obj.addLibPath("wiringPi/lib/libwiringPi.so");
    // obj.addLibPath("wiringPi/lib/libsigc-1.2.so.5.0.7");
    // obj.addLibPath("wiringPi/lib/libwiringPi.so.2.5");
    
    // obj.addIncludeDir("Raspberry-ssd1306");
    // obj.addCSourceFile("Raspberry-ssd1306/oled.c", &[_][]const u8{"-std=c99"});
    // obj.addIncludeDir("/usr/src/linux-headers-4.19.0-13-common/include/linux");
    // obj.addIncludeDir("/usr/src/linux-headers-4.19.0-13-amd64/");
    
    // obj.addCSourceFile("src/module.c", &[_][]const u8{"-std=c99"});
    // obj.addIncludeDir("../../../../BuiltFromSource/Raspberry-ssd1306");
    
    // obj.linkSystemLibrary("linux/module");
    // obj.linkSystemLibrary("linux/init");

    // Generate header file /* Note: not yet available on stage 1 */
    // obj.emit_h = true;


    // obj.linkLibC();
    // obj.();

    // const run_cmd = exe.run();
    // run_cmd.step.dependOn(b.getInstallStep());
    // if (b.args) |args| {
    //     run_cmd.addArgs(args);
    // }

    // const run_step = b.step("run", "Run the app");
    // run_step.dependOn(&run_cmd.step);
}
