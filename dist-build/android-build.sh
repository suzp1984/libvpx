if [ -z "$ANDROID_NDK_HOME" ]; then
    echo "You should probably set ANDROID_NDK_HOME to the directory containing"
    echo "the Android NDK"
    exit
fi

if [ ! -f ./configure ]; then
	echo "Can't find ./configure. Wrong directory or haven't run autogen.sh?"
	exit 1
fi

./configure --target=armv7-android-gcc \
            --disable-examples \
            --disable-docs \
            --sdk-path="${ANDROID_NDK_HOME}" \
            --prefix=./libvpx-android-armv7 \
            --extra-cflags="-mfloat-abi=softfp -mfpu=neon" || exit 1

make clean && make && make install
