set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

find_path(GNU_ARM_EMBEDDED_TOOLCHAIN
  NAMES
    "arm-none-eabi-gcc"
    "arm-none-eabi-g++"
  DOC "GNU Arm Embedded Toolchain"
  PATHS
    ${STM32_TOOLCHAIN}
    $ENV{HOME}/tools/toolchains/gcc-arm-none-eabi-10.3-2021.07/bin
    /opt/gcc-arm-none-eabi-10.3-2021.10
)

set(CMAKE_C_COMPILER "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-g++")
set(CMAKE_ASM_COMPILER "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-gcc")
set(CMAKE_AR "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-ar")
set(CMAKE_RANLIB "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-ranlib")
set(TOOLCHAIN_OBJCOPY "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-objcopy")
set(TOOLCHAIN_OBJDUMP "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-objdump")
set(TOOLCHAIN_SIZE "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-size")
set(TOOLCHAIN_NM "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-nm")
set(TOOLCHAIN_STRIP "${GNU_ARM_EMBEDDED_TOOLCHAIN}/arm-none-eabi-strip")

set(CMAKE_C_FLAGS_DEBUG "-Og -g3")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g3")
set(CMAKE_ASM_FLAGS_DEBUG "-Og -g3")

set(CMAKE_C_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_ASM_FLAGS_RELEASE "-O2")

set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELEASE} -g3")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELEASE} -g3")
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO "${CMAKE_ASM_FLAGS_RELEASE} -g3")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
