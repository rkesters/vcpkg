
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO rkesters/vita-49
  REF 161344b8215f051cdd16239b347a5fce3751a95d
  SHA512 500d5c7a43d1caa7c985fe16112015f939aef7eafd1b31ce4267491b2b7278e231e02e75a9ae4fae6bb6fa826100a9e10adc5ae38bbbfa8b8eacf3586cf9e1f9
  HEAD_REF cmake
#  PATCHES 
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH share/vrt TARGET_PATH share/vrt)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")


# # Handle copyright
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/vrt RENAME copyright)
file(INSTALL ${SOURCE_PATH}/LICENSE DESTINATION ${CURRENT_PACKAGES_DIR}/share/vita49 RENAME copyright)

# # Post-build test for cmake libraries
vcpkg_test_cmake(PACKAGE_NAME vrt)
