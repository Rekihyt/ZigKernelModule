const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    const obj = b.addObject("zig", "src/zig.zig");
    const mode = b.standardReleaseOptions();
    obj.setBuildMode(mode);
    obj.addIncludeDir("include");
}
