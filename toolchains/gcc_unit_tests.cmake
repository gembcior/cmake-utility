find_path(CMAKE_C_COMPILER
  NAMES
    gcc
  DOC "GNU GCC C Toolchain"
)

find_path(CMAKE_CXX_COMPILER
  NAMES
    g++
  DOC "GNU GCC C++ Toolchain"
)

set(CMAKE_ASM_COMPILER "${GNU_ARM_EMBEDDED_TOOLCHAIN}/bin/arm-none-eabi-gcc")
set(CMAKE_AR "${GNU_ARM_EMBEDDED_TOOLCHAIN}/bin/arm-none-eabi-ar")
set(CMAKE_RANLIB "${GNU_ARM_EMBEDDED_TOOLCHAIN}/bin/arm-none-eabi-ranlib")
set(TOOLCHAIN_OBJCOPY "${GNU_ARM_EMBEDDED_TOOLCHAIN}/bin/arm-none-eabi-objcopy")
set(TOOLCHAIN_OBJDUMP "${GNU_ARM_EMBEDDED_TOOLCHAIN}/bin/arm-none-eabi-objdump")
set(TOOLCHAIN_SIZE "${GNU_ARM_EMBEDDED_TOOLCHAIN}/bin/arm-none-eabi-size")
set(TOOLCHAIN_NM "${GNU_ARM_EMBEDDED_TOOLCHAIN}/bin/arm-none-eabi-nm")
set(TOOLCHAIN_STRIP "${GNU_ARM_EMBEDDED_TOOLCHAIN}/bin/arm-none-eabi-strip")

set(CMAKE_C_FLAGS_DEBUG "-Og -g3")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g3")
set(CMAKE_ASM_FLAGS_DEBUG "-Og -g3")

set(CMAKE_C_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_ASM_FLAGS_RELEASE "-O2")

string(CONCAT C_FLAGS
  "-Wall "
  "-Werror "
  "-Wfatal-errors "
)

string(CONCAT CXX_FLAGS
  "-Wall "
  "-Werror "
  "-Wfatal-errors "
)

set(CMAKE_C_FLAGS_INIT ${C_FLAGS})
set(CMAKE_CXX_FLAGS_INIT ${CXX_FLAGS})
