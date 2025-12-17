# LLFI GPU integration helpers
#
# Expects the following cache variables to be defined before inclusion:
#   HECBENCH_LLFI_GPU_ROOT - path to LLFI-GPU checkout
#   HECBENCH_LLFI_MODE     - profiling|injection

if(NOT EXISTS "${HECBENCH_LLFI_GPU_ROOT}")
    message(FATAL_ERROR "LLFI-GPU root '${HECBENCH_LLFI_GPU_ROOT}' does not exist")
endif()

set(_llfi_bamboo_dir "${HECBENCH_LLFI_GPU_ROOT}/bamboo_lib")
if(NOT EXISTS "${_llfi_bamboo_dir}")
    message(FATAL_ERROR "LLFI-GPU bamboo_lib not found under ${HECBENCH_LLFI_GPU_ROOT}")
endif()

string(TOLOWER "${HECBENCH_LLFI_MODE}" _llfi_mode)
set_property(CACHE HECBENCH_LLFI_MODE PROPERTY STRINGS profiling injection)

if(_llfi_mode STREQUAL "profiling")
    set(_llfi_lib_dir "${_llfi_bamboo_dir}/profiling_lib")
    set(_llfi_runtime_src "${_llfi_lib_dir}/profiling_runtime.cu")
    set(_llfi_support_src "${_llfi_lib_dir}/bamboo_profiling.cu")
    set(_llfi_compile_define "BAMBOO_PROFILING")
elseif(_llfi_mode STREQUAL "injection")
    set(_llfi_lib_dir "${_llfi_bamboo_dir}/injection_lib")
    set(_llfi_runtime_src "${_llfi_lib_dir}/injection_runtime.cu")
    set(_llfi_support_src "${_llfi_lib_dir}/bamboo_injection.cu")
    set(_llfi_compile_define "BAMBOO_INJECTION")
else()
    message(FATAL_ERROR "Unknown LLFI-GPU mode '${HECBENCH_LLFI_MODE}' (expected profiling or injection)")
endif()

foreach(_llfi_file "${_llfi_runtime_src}" "${_llfi_support_src}" "${_llfi_lib_dir}/libnvcc.so" "${_llfi_lib_dir}/libcicc.so")
    if(NOT EXISTS "${_llfi_file}")
        message(FATAL_ERROR "Required LLFI-GPU artifact '${_llfi_file}' not found")
    endif()
endforeach()

# Prepare nvcc launcher that injects LLFI's custom libnvcc interposer
set(_llfi_wrapper "${CMAKE_BINARY_DIR}/llfi_nvcc_wrapper.sh")
set(_llfi_preload "${_llfi_lib_dir}/libnvcc.so")
set(_llfi_libcicc "${_llfi_lib_dir}/libcicc.so")
set(LLFI_PRELOAD "${_llfi_preload}:${_llfi_libcicc}")
set(LLFI_PREV_LAUNCHER "${_llfi_prev_launcher}")

configure_file(
    "${CMAKE_SOURCE_DIR}/cmake/scripts/llfi_nvcc_wrapper.sh.in"
    "${_llfi_wrapper}"
    @ONLY
)

file(CHMOD "${_llfi_wrapper}" PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)

set(_llfi_prev_launcher "")
if(CMAKE_CUDA_COMPILER_LAUNCHER)
    set(_llfi_prev_launcher_list ${CMAKE_CUDA_COMPILER_LAUNCHER})
    list(JOIN _llfi_prev_launcher_list ";" _llfi_prev_launcher)
    message(STATUS "LLFI-GPU will wrap existing CUDA compiler launcher: ${_llfi_prev_launcher}")
endif()

set(CMAKE_CUDA_COMPILER_LAUNCHER "${_llfi_wrapper}" CACHE STRING "" FORCE)

set(HECBENCH_LLFI_ENABLED TRUE CACHE BOOL "" FORCE)
set(HECBENCH_LLFI_RUNTIME_SRC "${_llfi_runtime_src}" CACHE FILEPATH "" FORCE)
set(HECBENCH_LLFI_SUPPORT_SRC "${_llfi_support_src}" CACHE FILEPATH "" FORCE)
set(HECBENCH_LLFI_DEFINE "${_llfi_compile_define}" CACHE STRING "" FORCE)
set(HECBENCH_LLFI_MODE_LOWER "${_llfi_mode}" CACHE STRING "" FORCE)
set(LLFI_PREV_LAUNCHER "${_llfi_prev_launcher}" CACHE STRING "" FORCE)
