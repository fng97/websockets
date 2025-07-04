const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "websockets",
        .root_source_file = b.path("src/websockets.zig"),
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(lib);

    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/websockets.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);
    run_lib_unit_tests.has_side_effects = true; // so that test runs aren't cached

    const lib_unit_tests_check = b.addTest(.{
        .root_source_file = b.path("src/websockets.zig"),
        .target = target,
        .optimize = optimize,
    });
    const check = b.step("check", "Check: See https://zigtools.org/zls/guides/build-on-save/");
    check.dependOn(&lib_unit_tests_check.step);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
}
