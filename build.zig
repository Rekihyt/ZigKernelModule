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
    const mode = b.standardReleaseOptions();
    obj.setBuildMode(mode);
    obj.addIncludeDir("include");
}
