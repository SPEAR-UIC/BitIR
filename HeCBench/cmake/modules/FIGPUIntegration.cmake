# FI GPU integration helpers
#
# Expects the following cache variables to be defined before inclusion:
#   HECBENCH_FI_GPU_ROOT - path to FI-GPU checkout
#   HECBENCH_FI_MODE     - profiling|injection

if(NOT EXISTS "${HECBENCH_FI_GPU_ROOT}")
    message(FATAL_ERROR "FI-GPU root '${HECBENCH_FI_GPU_ROOT}' does not exist")
endif()

set(_fi_bamboo_dir "${HECBENCH_FI_GPU_ROOT}/bamboo_lib")
if(NOT EXISTS "${_fi_bamboo_dir}")
    message(FATAL_ERROR "FI-GPU bamboo_lib not found under ${HECBENCH_FI_GPU_ROOT}")
endif()

string(TOLOWER "${HECBENCH_FI_MODE}" _fi_mode)
set_property(CACHE HECBENCH_FI_MODE PROPERTY STRINGS profiling injection)

if(_fi_mode STREQUAL "profiling")
    set(_fi_lib_dir "${_fi_bamboo_dir}/profiling_lib")
    set(_fi_runtime_src "${_fi_lib_dir}/profiling_runtime.cu")
    set(_fi_support_src "${_fi_lib_dir}/bamboo_profiling.cu")
    set(_fi_compile_define "BAMBOO_PROFILING")
elseif(_fi_mode STREQUAL "injection")
    set(_fi_lib_dir "${_fi_bamboo_dir}/injection_lib")
    set(_fi_runtime_src "${_fi_lib_dir}/injection_runtime.cu")
    set(_fi_support_src "${_fi_lib_dir}/bamboo_injection.cu")
    set(_fi_compile_define "BAMBOO_INJECTION")
else()
    message(FATAL_ERROR "Unknown FI-GPU mode '${HECBENCH_FI_MODE}' (expected profiling or injection)")
endif()

foreach(_fi_file "${_fi_runtime_src}" "${_fi_support_src}" "${_fi_lib_dir}/libnvcc.so" "${_fi_lib_dir}/libcicc.so")
    if(NOT EXISTS "${_fi_file}")
        message(FATAL_ERROR "Required FI-GPU artifact '${_fi_file}' not found")
    endif()
endforeach()

# Prepare nvcc launcher that injects FI's custom libnvcc interposer
set(_fi_wrapper "${CMAKE_BINARY_DIR}/fi_nvcc_wrapper.sh")
set(_fi_preload "${_fi_lib_dir}/libnvcc.so")
set(_fi_libcicc "${_fi_lib_dir}/libcicc.so")
set(FI_PRELOAD "${_fi_preload}:${_fi_libcicc}")
set(FI_PREV_LAUNCHER "${_fi_prev_launcher}")

configure_file(
    "${CMAKE_SOURCE_DIR}/cmake/scripts/fi_nvcc_wrapper.sh.in"
    "${_fi_wrapper}"
    @ONLY
)

file(CHMOD "${_fi_wrapper}" PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE)

set(_fi_prev_launcher "")
if(CMAKE_CUDA_COMPILER_LAUNCHER)
    set(_fi_prev_launcher_list ${CMAKE_CUDA_COMPILER_LAUNCHER})
    list(JOIN _fi_prev_launcher_list ";" _fi_prev_launcher)
    message(STATUS "FI-GPU will wrap existing CUDA compiler launcher: ${_fi_prev_launcher}")
endif()

set(CMAKE_CUDA_COMPILER_LAUNCHER "${_fi_wrapper}" CACHE STRING "" FORCE)

set(HECBENCH_FI_ENABLED TRUE CACHE BOOL "" FORCE)
set(HECBENCH_FI_RUNTIME_SRC "${_fi_runtime_src}" CACHE FILEPATH "" FORCE)
set(HECBENCH_FI_SUPPORT_SRC "${_fi_support_src}" CACHE FILEPATH "" FORCE)
set(HECBENCH_FI_DEFINE "${_fi_compile_define}" CACHE STRING "" FORCE)
set(HECBENCH_FI_MODE_LOWER "${_fi_mode}" CACHE STRING "" FORCE)
set(FI_PREV_LAUNCHER "${_fi_prev_launcher}" CACHE STRING "" FORCE)
