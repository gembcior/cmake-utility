function(FILE_INSTALL TARGET FILE)
  install(FILES ${FILE}
    DESTINATION Release/${TARGET}
    CONFIGURATIONS Release RelWithDebInfo
  )
  install(FILES ${FILE}
    DESTINATION Debug/${TARGET}
    CONFIGURATIONS Debug
  )
endfunction()


function(TARGET_INSTALL TARGET)
  install(TARGETS ${TARGET}
    CONFIGURATIONS Release RelWithDebInfo
    RUNTIME DESTINATION Release/bin
  )

  install(TARGETS ${TARGET}
    CONFIGURATIONS Debug
    RUNTIME DESTINATION Debug/bin
  )
endfunction()


macro(GET_TARGET_OUTPUT_FILE TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  set(TARGET_OUTPUT_FILE ${TARGET})
  if (TARGET_SUFFIX)
    string(APPEND TARGET_OUTPUT_FILE ${TARGET_SUFFIX})
  endif()
endmacro()


function(GENERATE_TARGET_LISTING TARGET)
  get_target_output_file(${TARGET})
  add_custom_command(TARGET ${TARGET}
    POST_BUILD
    COMMAND ${TOOLCHAIN_OBJDUMP} -h -D -C ${TARGET_OUTPUT_FILE} > ${TARGET}.lst
  )
  file_install(${TARGET} ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}.lst)
endfunction()


function(GENERATE_TARGET_HEX_FILE TARGET)
  get_target_output_file(${TARGET})
  add_custom_command(TARGET ${TARGET}
    POST_BUILD
    COMMAND ${TOOLCHAIN_OBJCOPY} -O ihex ${TARGET_OUTPUT_FILE} ${TARGET}.hex
  )
  file_install(${TARGET} ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}.hex)
endfunction()


function(GENERATE_TARGET_BIN_FILE TARGET)
  get_target_output_file(${TARGET})
  add_custom_command(TARGET ${TARGET}
    POST_BUILD
    COMMAND ${TOOLCHAIN_OBJCOPY} -O binary ${TARGET_OUTPUT_FILE} ${TARGET}.bin
  )
  file_install(${TARGET} ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}.bin)
endfunction()


function(GENERATE_TARGET_MAP_FILE TARGET)
  target_link_options(${TARGET}
    PRIVATE
     "LINKER:-Map,${CMAKE_CURRENT_BINARY_DIR}/${TARGET}.map"
   )
  file_install(${TARGET} ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}.map)
endfunction()


function(PRINT_TARGET_SIZE TARGET)
  get_target_output_file(${TARGET})
  add_custom_command(TARGET ${TARGET}
    POST_BUILD COMMAND
    ${TOOLCHAIN_SIZE} ${TARGET_OUTPUT_FILE}
    COMMENT "Size report for ${TARGET}"
  )
endfunction()


function(TARGET_APP_RELEASE TARGET)
  print_target_size(${TARGET})
  generate_target_hex_file(${TARGET})
  generate_target_bin_file(${TARGET})
  generate_target_listing(${TARGET})
  generate_target_map_file(${TARGET})
  target_install(${TARGET})
endfunction()
