
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO rkesters/VITA49
  REF 484b1dcfd6421f196c32ae375745dfbb71d9f25e
  SHA512 c12ad5b6d09a12a630e68ea5381434fdf0be0e3dac7fc7446c3eafe6ab04d98945b047218421710e6d1ac45b9b5d1f0207b8d45feed38e5d7c13c473f9bde3b8
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
