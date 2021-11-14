include(Utils)


function(CPP_TARGET_APP_RELEASE TARGET)
  print_target_size(${TARGET})
  generate_target_listing(${TARGET})
  generate_target_map_file(${TARGET})
  target_install(${TARGET})
endfunction()
