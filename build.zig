const std = @import("std");
const fmt = std.fmt;
const Builder = std.build.Builder;


pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const mainFileName = "mymodule";
    const src_dir = "src";
    const mainFilePath = fmt.comptimePrint("{s}/{s}.zig", .{ src_dir, mainFileName });

    const main_tests = b.addTest(mainFilePath);
    main_tests.setBuildMode(mode);
    
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);

    const obj = b.addObject(mainFileName, mainFilePath);
    obj.out_filename = mainFileName ++ ".o_shipped";
    obj.output_dir = src_dir;
    obj.setBuildMode(.Debug);
    obj.strip = true;
    const obj_step = b.step("obj", "Make debug object file");
    obj_step.dependOn(&obj.step);

}
