
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO rkesters/VITA49
  REF 35cbb04cedd06a3d9daf9b53e652d7886640ea3f
  SHA512 e4c7a6e24e3d64ffe1ea70f8d71b1eab72c3ec0a316153f3cd9d0fa6e81c58f3291d719f0876da5c748a7d30da95ad4b45d8c87ca3d4d5e9b29baee70a7541b5
  HEAD_REF cmake
#  PATCHES 
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH share/VITA49 TARGET_PATH share/VITA49)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")


# # Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/redhawk-vita49 RENAME copyright)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/VITA49 RENAME copyright)

# # Post-build test for cmake libraries
vcpkg_test_cmake(PACKAGE_NAME VITA49)
