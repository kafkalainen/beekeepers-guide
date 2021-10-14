## How to get valgrind on your desktop

Can't figure out where a pesky memory leak is? Aim your lance at [Valgrind](https://www.valgrind.org/). Although `leaks` is a program that is asked to use in evaluations, It'll help you to track down uninitialized values, going off the memory addresses, and much more.

- Install valgrind with:
`sudo apt install valgrind`

and on MacOS:
`brew install valgrind`

- Start up valgrind by typing
`valgrind ./a.out`

Although valgrind might give you an idea, it might be intimidating at first to read the program output.
I'm asking for trouble with `a.c`, which has following code:

	#include <stdlib.h>
	#include <unistd.h>

	int main(void)
	{
		char *hello;
		hello = (char*)malloc(18);
		write(1, hello, 18);
		return (0);
	}

When I run the program with these, it produces following errors, when compiled and given to valgrind.

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

So Valgrind gives me message when I try to write uninitialized bytes. And also it tells me that I forgot to
free the memory. Let's fix that.

	#include <stdlib.h>
	#include <unistd.h>
	#include <string.h>

	int main(void)
	{
		char *hello;

		hello = (char*)malloc(18);
		strcpy(hello, "thanksforthefish\n\0");
		write(1, hello, 18);
		free(hello);
		return (0);
	}

So let's try again.

	==1914210== Memcheck, a memory error detector
	==1914210== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
	==1914210== Using Valgrind-3.17.0 and LibVEX; rerun with -h for copyright info
	==1914210== Command: ./a.out
	==1914210==
	thanksforthefish
	==1914210==
	==1914210== HEAP SUMMARY:
	==1914210==     in use at exit: 0 bytes in 0 blocks
	==1914210==   total heap usage: 1 allocs, 1 frees, 18 bytes allocated
	==1914210==
	==1914210== All heap blocks were freed -- no leaks are possible
	==1914210==
	==1914210== For lists of detected and suppressed errors, rerun with: -s
	==1914210== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)

Looking great!

Example from real life. I was wondering why valgrind complained about uninitialized values in our group project.

	==842072== Conditional jump or move depends on uninitialised value(s)
	==842072==    at 0x11DB3A: place_entity_to_ground (entity_move.c:58)
	==842072==    by 0x11DDDF: entity_move (entity_move.c:80)
	==842072==    by 0x11F366: update_entity (update_entities.c:60)
	==842072==    by 0x11F4E1: update_entities (update_entities.c:84)
	==842072==    by 0x150B84: update_world (launch_modules.c:33)
	==842072==    by 0x150C87: launch_game_loop (launch_modules.c:53)
	==842072==    by 0x10AAD6: main (main.c:72)
	==842072==
	==842072== Conditional jump or move depends on uninitialised value(s)
	==842072==    at 0x1311BD: entity_gravity (gravity.c:62)
	==842072==    by 0x11F26F: update_entity (update_entities.c:50)
	==842072==    by 0x11F4E1: update_entities (update_entities.c:84)
	==842072==    by 0x150B84: update_world (launch_modules.c:33)
	==842072==    by 0x150C87: launch_game_loop (launch_modules.c:53)
	==842072==    by 0x10AAD6: main (main.c:72)
	==842072==

So, I added line `printf("entity idx %d sprite idx %d\n", entity->idx, entity->sprite_idx);` to code, and valgrind prints those in between.

	==842994== Memcheck, a memory error detector
	==842994== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
	==842994== Using Valgrind-3.17.0 and LibVEX; rerun with -h for copyright info
	==842994== Command: ./doom-nukem
	==842994==
	Raster queues created, and viewport initialized.
	You chose: map_files/laalaa.DN
	Verification successfull
	mkdir: cannot create directory ‘temp’: File exists
	entity idx 3 sprite idx -27
	==842994== Conditional jump or move depends on uninitialised value(s)
	==842994==    at 0x11DB5A: place_entity_to_ground (entity_move.c:58)
	==842994==    by 0x11DDFF: entity_move (entity_move.c:80)
	==842994==    by 0x11F386: update_entity (update_entities.c:60)
	==842994==    by 0x11F501: update_entities (update_entities.c:84)
	==842994==    by 0x150BCB: update_world (launch_modules.c:33)
	==842994==    by 0x150CCE: launch_game_loop (launch_modules.c:53)
	==842994==    by 0x10AAF6: main (main.c:72)
	==842994==
	entity idx 4 sprite idx -26
	entity idx 3 sprite idx -27
	entity idx 4 sprite idx -26
	==842994== Conditional jump or move depends on uninitialised value(s)
	==842994==    at 0x131204: entity_gravity (gravity.c:63)
	==842994==    by 0x11F28F: update_entity (update_entities.c:50)
	==842994==    by 0x11F501: update_entities (update_entities.c:84)
	==842994==    by 0x150BCB: update_world (launch_modules.c:33)
	==842994==    by 0x150CCE: launch_game_loop (launch_modules.c:53)
	==842994==    by 0x10AAF6: main (main.c:72)
	==842994==
	entity idx 3 sprite idx -27
	entity idx 4 sprite idx -26
	entity idx 3 sprite idx -27
	entity idx 4 sprite idx -26
	entity idx 3 sprite idx -27
	entity idx 4 sprite idx -26

So, I could say that it happens only with one entity.
Which led us to conclusion, that it was caused by one variable that was not initialized during startup.
