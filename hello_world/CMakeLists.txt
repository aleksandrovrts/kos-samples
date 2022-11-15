cmake_minimum_required (VERSION 3.12)

project (hello)

# Initialize CMake library for KasperskyOS SDK.
include (platform)
initialize_platform ()

# Toolchain for work with NK-parser.
include (platform/nk)

# Set compile flags.
project_header_default ("STANDARD_GNU_11:YES" "STRICT_WARNINGS:NO")

nk_build_edl_files (hello_edl_files NK_MODULE "hello" EDL "${CMAKE_SOURCE_DIR}/resources/edl/Hello.edl")

add_executable (Hello "hello/hello.c")
add_dependencies (Hello hello_edl_files)

include (platform/image)

# Set compile flags.
project_header_default ("STANDARD_GNU_11:YES" "STRICT_WARNINGS:NO")

# Define the ENTITIES variable with a list of entities.
set (ENTITIES Hello)
set (SECURITY_PSL_FILE "einit/security.psl")

# KasperskyOS image for target hardware platform.
build_kos_hw_image (kos-image
                    EINIT_ENTITY EinitHw
                    CONNECTIONS_CFG "einit/init.yaml.in"
                    SECURITY_PSL ${SECURITY_PSL_FILE}
                    ${ENTITIES})

# KasperskyOS image for QEMU with simulation targets (sim, gdbsim, gdb).
build_kos_qemu_image (kos-qemu-image
                      EINIT_ENTITY EinitQemu
                      CONNECTIONS_CFG "einit/init.yaml.in"
                      SECURITY_PSL ${SECURITY_PSL_FILE}
                      ${ENTITIES})

