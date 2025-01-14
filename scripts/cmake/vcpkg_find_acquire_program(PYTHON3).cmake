if(CMAKE_HOST_WIN32)
    set(program_name python)
    set(program_version 3.12.7)
    if(DEFINED ENV{PROCESSOR_ARCHITEW6432})
        set(build_arch $ENV{PROCESSOR_ARCHITEW6432})
    else()
        set(build_arch $ENV{PROCESSOR_ARCHITECTURE})
    endif()
    if(build_arch MATCHES "^(ARM|arm)64$")
        set(tool_subdirectory "python-${program_version}-arm64")
        # https://www.python.org/ftp/python/3.12.7/python-3.12.7-embed-arm64.zip
        set(download_urls "https://www.python.org/ftp/python/${program_version}/python-${program_version}-embed-arm64.zip")
        set(download_filename "python-${program_version}-embed-arm64.zip")
        set(download_sha512 D1D1183682D20AC057C45BF2AD264B6568CDEB54A1502823C76A2448386CAEF79A3AB9EA8FF57A5C023D432590FCCB5E3E9980F8760CD9BAAC5A2A82BA240D73)
    elseif(build_arch MATCHES "(amd|AMD)64")
        set(tool_subdirectory "python-${program_version}-x64")
        # https://www.python.org/ftp/python/3.12.7/python-3.12.7-embed-amd64.zip change to
        # https://raw.githubusercontent.com/adang1345/PythonWin7/master/3.12.7/python-3.12.7-embed-amd64.zip
        set(download_urls "https://raw.githubusercontent.com/adang1345/PythonWin7/master/${program_version}/python-${program_version}-embed-amd64.zip")
        set(download_filename "python-${program_version}-embed-amd64.zip")
        set(download_sha512 1da4b1e3aec60d23806bff5d4245800eda1c07a39c3566e5da19cf6a9bd0539327fb710e37328631d9f1c6e98f31c5124ae62d66b0e0df10c8bfd478d9041f26)
    else()
        set(tool_subdirectory "python-${program_version}-x86")
        # https://www.python.org/ftp/python/3.12.7/python-3.12.7-embed-win32.zip
        set(download_urls "https://www.python.org/ftp/python/${program_version}/python-${program_version}-embed-win32.zip")
        set(download_filename "python-${program_version}-embed-win32.zip")
        set(download_sha512 15542080E0CC25C574391218107FE843006E8C5A7161D1CD48CF14A3C47155C0244587273D9C747F35B15EA17676869ECCE079214824214C1A62ABFC86AD9F9B)
    endif()

    set(paths_to_search "${DOWNLOADS}/tools/python/${tool_subdirectory}")

    # We want to be able to import stuff from outside of this embeddable package.
    # https://docs.python.org/3/library/sys_path_init.html#pth-files
    string(REGEX MATCH "^3\\.[0-9]+" _python_version_plain "${program_version}")
    string(REPLACE "." "" _python_version_plain "${_python_version_plain}")
    vcpkg_list(SET post_install_command "${CMAKE_COMMAND}" -E rm "python${_python_version_plain}._pth")
else()
    set(program_name python3)
    set(brew_package_name "python")
    set(apt_package_name "python3")
endif()
