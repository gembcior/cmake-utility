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

find_path(CMAKE_ASM_COMPILER
  NAMES
    gcc
  DOC "GNU GCC ASM Toolchain"
)

find_path(CMAKE_AR
  NAMES
    ar
  DOC "Ar"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_path(CMAKE_RANLIB
  NAMES
    ranlib
  DOC "Ranlib"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_path(TOOLCHAIN_OBJCOPY
  NAMES
    objcopy
  DOC "Objcopy"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_path(TOOLCHAIN_OBJDUMP
  NAMES
    objdump
  DOC "Objdump"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_path(TOOLCHAIN_SIZE
  NAMES
    size
  DOC "Size"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_path(TOOLCHAIN_NM
  NAMES
    nm
  DOC "Nm"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

find_path(TOOLCHAIN_STRIP
  NAMES
    strip
  DOC "Strip"
  PATHS
    ${NATIVE_TOOLCHAIN}
)

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
