const Builder = std.build.Builder;

pub fn build(b: *Builder) void {
    const obj = b.addObject("mymodule", "src/mymodule.zig");
    const mode = b.standardReleaseOptions();
    obj.setBuildMode(mode);
    obj.addIncludeDir("include");
}
