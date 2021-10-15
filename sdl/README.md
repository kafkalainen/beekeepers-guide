# How to install SDL2 on Linux
Some of the school material requires that used graphics library is included as srcs in the repository. We approached this as so that SDL2 is added as tarball to the repository, and extracted to the folder. Since the files are under same makefile rules as rest of the project, you can clean and fclean the SDL2 away as well. Also, this [is not the official guide](https://wiki.libsdl.org/Installation). Always question the best way to install. Check the documentation, make your own decisions, and work from there.

1. Get most recent release of the SDL2 from:

	https://www.libsdl.org/release/

2. Unpack tarball with:

	tar -xzf SDL2-{version_number}.tar.gz

3. Create a directory to root of your project. Folder could be named to anything:

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

	./SDL2/bin/sdl2-config --libs
	./SDL2/bin/sdl2-config --cflags

You will also need to `#include` SDL header in the .c file, to give your program access to the range of SDL functions.

	#include "SDL2/include/SDL2/SDL.h"

Example, you could compile main.c using SDL2 following.

	gcc -Wall -Wextra -Werror $(./SDL2/bin/sdl2-config --cflags) main.c -L$(./SDL2/bin/sdl2-config --libs)

Check, what sdl2-config command outputs, and you will be able to use it in your makefile rules.
