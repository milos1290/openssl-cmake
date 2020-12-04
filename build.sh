android_archs="armeabi-v7a arm64-v8a x86_64"

rm -rf build
rm -rf prebuilt

for arch in $android_archs
do
    build_dir=build/${arch}
    mkdir -p ${build_dir}
    cd ${build_dir}

    cmake ../../ -DCMAKE_TOOLCHAIN_FILE="${ANDROID_NDK_ROOT}/build/cmake/android.toolchain.cmake" -DANDROID_ABI=${arch}
    make install -j12

    cd -
done
