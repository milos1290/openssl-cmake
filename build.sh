android_archs="armeabi-v7a arm64-v8a x86_64 x86"
android_api_level=21

rm -rf build
rm -rf prebuilt

for arch in $android_archs
do
    build_dir=build/${arch}
    mkdir -p ${build_dir}
    cd ${build_dir}

    cmake ../../ \
        -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_ROOT}/build/cmake/android.toolchain.cmake" \
        -DANDROID_ABI=${arch} \
        -DANDROID_PLATFORM=${android_api_level} \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_SYSTEM_NAME=Android \
        -DCMAKE_SYSTEM_VERSION=${android_api_level}
    make install -j12

    cd -
done
