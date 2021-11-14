function(FILE_INSTALL TARGET FILE)
  install(FILES ${FILE}
    DESTINATION Release/${TARGET}
    CONFIGURATIONS Release
  )
  install(FILES ${FILE}
    DESTINATION Debug/${TARGET}
    CONFIGURATIONS Debug
  )
endfunction()


function(TARGET_INSTALL TARGET)
  install(TARGETS ${TARGET}
    CONFIGURATIONS Release
    RUNTIME DESTINATION Release/bin
  )

  install(TARGETS ${TARGET}
    CONFIGURATIONS Debug
    RUNTIME DESTINATION Debug/bin
  )
endfunction()


function(GENERATE_TARGET_LISTING TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET}
    POST_BUILD
    COMMAND ${TOOLCHAIN_OBJDUMP} -h -D -C ${TARGET}${TARGET_SUFFIX} > ${TARGET}.lst
  )
  file_install(${TARGET} ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}.lst)
endfunction()


function(GENERATE_TARGET_HEX_FILE TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET}
    POST_BUILD
    COMMAND ${TOOLCHAIN_OBJCOPY} -O ihex ${TARGET}${TARGET_SUFFIX} ${TARGET}.hex
  )
  file_install(${TARGET} ${CMAKE_CURRENT_BINARY_DIR}/${TARGET}.hex)
endfunction()


function(GENERATE_TARGET_BIN_FILE TARGET)
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET}
    POST_BUILD
    COMMAND ${TOOLCHAIN_OBJCOPY} -O binary ${TARGET}${TARGET_SUFFIX} ${TARGET}.bin
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
  get_target_property(TARGET_SUFFIX ${TARGET} SUFFIX)
  add_custom_command(TARGET ${TARGET}
    POST_BUILD COMMAND
    ${TOOLCHAIN_SIZE} ${TARGET}${TARGET_SUFFIX}
    COMMENT "Size report for ${TARGET}"
  )
endfunction()
