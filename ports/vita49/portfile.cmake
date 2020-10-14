
vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO rkesters/vita-49
  REF 394974997b891e867b1d3f2e7ecfb39209f30e0c
  SHA512 71bb7653eb9824a9f39b4305ceb4094a21d83c0938d9a02ce0f6ddc2fe5d0cf670e544746fb95ff7a2f1e3aac7805489dd99221a43041fbd820e07aa64ccea62
  HEAD_REF redhawk
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
