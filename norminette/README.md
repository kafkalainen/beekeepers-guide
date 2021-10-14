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
