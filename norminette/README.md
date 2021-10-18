# How to get Norminette on your desktop

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

# Why Norminette?


	A structure’s name must start by s_.
	A typedef’s name must start by t_.
	A union’s name must start by u_.
	An enum’s name must start by e_.
	A global’s name must start by g_.

Take a look on following coding art article. [About naming](https://codingart.readthedocs.io/en/latest/c/Naming.html)

	All identifiers (functions, macros, types, variables, etc.) must be in English

School is in English, and English is the lingua franca in coding world. So should your code be written in English as well.

[Why too many arguments to functions is bad](https://matheus.ro/2018/01/29/clean-code-avoid-many-arguments-functions/)

	Using global variables that are not marked const and static is forbidden and is
	considered a norm error, unless the project explicitly allows them.

[Why should we avoid using global variables in C/C++?](https://www.tutorialspoint.com/Why-should-we-avoid-using-global-variables-in-C-Cplusplus)

	You must indent your code with 4-space tabulations. This is not the same as 4
	average spaces, we’re talking about real tabulations here.

[Tabs are more popular](https://insanelab.com/blog/notes/spaces-vs-tabs/)

	Each function must be maximum 25 lines, not counting the function’s own curly
	brackets

[Ideal length 5 - 15 lines](https://softwareengineering.stackexchange.com/questions/133404/what-is-the-ideal-length-of-a-method-for-you)

	Each line must be at most 80 columns wide, comments included. Warning: a
	tabulation doesn’t count as a column, but as the number of spaces it represents.

[80 characters is historical column width of IBM punchcard](https://softwareengineering.stackexchange.com/questions/148677/why-is-80-characters-the-standard-limit-for-code-width)

	One instruction per line.

[Readability](https://softwareengineering.stackexchange.com/questions/104066/single-line-statements-good-practices)

	An empty line must be empty: no spaces or tabulations.
	A line can never end with spaces or tabulations.
	You can never have two consecutive spaces.
	You need to start a new line after each curly bracket or end of control structure.

[Consistency, code is harder to understand on multiple lines](https://softwareengineering.stackexchange.com/questions/251216/is-too-much-whitespace-a-bad-thing)

[Difficulty of going to the end of the code](https://softwareengineering.stackexchange.com/questions/121555/why-is-trailing-whitespace-a-big-deal)

	The asterisks that go with pointers must be stuck to variable names.

[A matter of preference](https://stackoverflow.com/questions/2660633/declaring-pointers-asterisk-on-the-left-or-right-of-the-space-between-the-type)
