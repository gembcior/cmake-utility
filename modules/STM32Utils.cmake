include(Utils)


function(STM32_TARGET_APP_RELEASE TARGET)
  set_property(TARGET ${TARGET} PROPERTY SUFFIX .elf)
  print_target_size(${TARGET})
  generate_target_hex_file(${TARGET})
  generate_target_bin_file(${TARGET})
  generate_target_listing(${TARGET})
  generate_target_map_file(${TARGET})
  target_install(${TARGET})
endfunction()
