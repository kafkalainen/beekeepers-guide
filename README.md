# beekeepers-guide
Hi, this is beekeeper's guide to install all necessary school stuff


## How to get Norminette on your desktop

These instructions assume that you are working on Ubuntu based distribution (ie. Ubuntu, Pop_OS, Linux Mint!) of Linux.
Guide tested on Ubuntu 18.04, 20.04 and Pop_OS! 21.04.

`sudo apt update && sudo apt upgrade`

Start by updating your packages. System gets new and updated packages ever so often.

`sudo apt install build-essential python3-pip python3-venv`

Build essential has more than enough libraries to pull you through the compiling. They include the GNU debugger, g++/GNU compiler collection, and some more tools and libraries that are required. Also install python3 pip package manager and python3 virtual environment package.

`python3 -m pip install --upgrade pip setuptools`

Install setuptools package. Check
what `python3 -m` means from python3
man page.

`python3 -m venv venv`

This will create a virtual environment the folder you are in.
https://python-guide-cn.readthedocs.io/en/latest/dev/virtualenvs.html

`source venv/bin/activate`

This will activate the virtual environment, and you will be able to install packages inside this virtual environment, like Norminette.

`pip install norminette`

This will download the latest version of the Norminette.

`ln -s ~/venv/bin/norminette /usr/local/bin/norminette`

We need to add a link to the norminette binary in the local directory, so you can start norminette from your command line.
Otherwise norminette command would be available inside the virtual environment.

## How to get school debugger on your desktop

School machines have `lldb` debugger tool installed on them as a tool. You can read more from
[here](https://lldb.llvm.org/). Lldb is really powerful debugging tool, which allows you to debug C code line by line,
and is also at your disposal in exams. Although, it is not only tool available, as
VSCode and others have excellent debugging tools, I'm going to focus on `lldb`
`apt install lldb`

You can start debugging your program by writing `lldb a.out`, if your binary name is
`a.out`. Note that you must compile your
program with `-g` flag to see all lines!

Most likely you will see that your program has ran successfully, or in scenario
that it doesn't, you will see the error message.

	Process 1072840 launched:
	Fail
	Process 1072840 exited with status = 0 (0x00000000)

`lldb a.out Marvin`

You can give arguments to program by writing them after the command.

You can add breakpoints by writing b and the row where you want to set the breakpoint.

`b 42`

And that's not all. You can set the breakpoint to a function:

`b function_i_want_to_debug`

Or to a file:

`b function_file.c:42`

Or to a condition:

`br s -n foo -c '(int)strcmp(y,"marvin") == 0'`

You can list active breakpoints by:

`br`

And delete ones you want by:

`br del 1`

## How to get valgrind on your desktop

Can't figure out where a pesky memory leak is?
Aim your lance at [Valgrind](https://www.valgrind.org/). It'll help you to track down uninitialized values, going off the memory addresses, and much more.

Start up valgrind by typing
`valgrind ./a.out`


I'm asking for trouble with following program:

	#include <stdlib.h>
	#include <unistd.h>

	int main(void)
	{
		char *hello;
		hello = (char*)malloc(18);
		write(1, hello, 18);
		return (0);
	}

Which produces following errors, when compiled and given to valgrind.

	==1076470== Memcheck, a memory error detector
	==1076470== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
	==1076470== Using Valgrind-3.17.0 and LibVEX; rerun with -h for copyright info
	==1076470== Command: ./a.out 2123
	==1076470==
	==1076470== Syscall param write(buf) points to uninitialised byte(s)
	==1076470==    at 0x4973C27: write (write.c:26)
	==1076470==    by 0x109198: main (main.c:9)
	==1076470==  Address 0x4a5b040 is 0 bytes inside a block of size 18 alloc'd
	==1076470==    at 0x4842839: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
	==1076470==    by 0x10917E: main (main.c:8)
	==1076470==
	==1076470==
	==1076470== HEAP SUMMARY:
	==1076470==     in use at exit: 18 bytes in 1 blocks
	==1076470==   total heap usage: 1 allocs, 0 frees, 18 bytes allocated
	==1076470==
	==1076470== LEAK SUMMARY:
	==1076470==    definitely lost: 18 bytes in 1 blocks
	==1076470==    indirectly lost: 0 bytes in 0 blocks
	==1076470==      possibly lost: 0 bytes in 0 blocks
	==1076470==    still reachable: 0 bytes in 0 blocks
	==1076470==         suppressed: 0 bytes in 0 blocks
	==1076470== Rerun with --leak-check=full to see details of leaked memory
