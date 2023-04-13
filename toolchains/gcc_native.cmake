find_program(CMAKE_C_COMPILER
  NAMES
    gcc
  DOC "GNU GCC C Toolchain"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_program(CMAKE_CXX_COMPILER
  NAMES
    g++
  DOC "GNU GCC C++ Toolchain"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_program(CMAKE_ASM_COMPILER
  NAMES
    gcc
  DOC "GNU GCC ASM Toolchain"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_program(CMAKE_AR
  NAMES
    ar
  DOC "Path to ar program"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_program(CMAKE_RANLIB
  NAMES
    ranlib
  DOC "Path to ranlib program"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_program(TOOLCHAIN_OBJCOPY
  NAMES
    objcopy
  DOC "Path to objcopy program"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_program(TOOLCHAIN_OBJDUMP
  NAMES
    objdump
  DOC "Path to objdump program"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_program(TOOLCHAIN_SIZE
  NAMES
    size
  DOC "Path to size program"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_program(TOOLCHAIN_NM
  NAMES
    nm
  DOC "Path to nm program"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_program(TOOLCHAIN_STRIP
  NAMES
    strip
  DOC "Path to strip program"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

set(CMAKE_C_FLAGS_DEBUG "-Og -g3")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g3")
set(CMAKE_ASM_FLAGS_DEBUG "-Og -g3")

set(CMAKE_C_FLAGS_RELEASE "-O2")
set(CMAKE_CXX_FLAGS_RELEASE "-O2")
set(CMAKE_ASM_FLAGS_RELEASE "-O2")

set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELEASE} -g3")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELEASE} -g3")
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO "${CMAKE_ASM_FLAGS_RELEASE} -g3")
