# How to install SDL2

1. Get most recent release of the SDL2 from:

	https://www.libsdl.org/release/

2. Unpack tarball with:

	tar -xzf SDL2-2.0.14.tar.gz

3. Create a directory to root of your project:

	mkdir -p SDL2

4.  where your library shall be created.  Finally, you run the install.

	cd SDL2

	SDL2-2.0.14/configure --prefix=SDL2

Go to the directory, and do configure binary in the folder that had the tarball extracted to. With `--prefix=SDL2` you point configuration to the newly created SDL2 folder.

	make -j8

Next you will run `make -j8`, which makes SDL2 install optimal to the amount the cores, you have on your computer. You can get tbe number required by using command `echo 2+$(cat /proc/cpuinfo | grep processor | wc -l) | bc`

	make install

Finally run `make install`, and that's it! Now you should have SDL2 libraries, that can be also neatly cleaned. Your task is to figure out, how to automatize this entire process, by using your own makefile. ;)


# How to compile program that is using SDL2

When compiling project that is using sdl2, it comes with sdl2-config binary. It has the libraries and compilation flags that SDL uses you will need to compile your program.

	./SDL2/bin/sdl2-config --libs)
	./SDL2/bin/sdl2-config --cflags)

You will also need to `#include` SDL header in the *.h file, to give your program access to the range of SDL functions.
