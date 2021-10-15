# beekeepers-guide
Hi, this is beekeeper's guide to install all necessary school stuff. Each chapter is broken down to program folders, where you will find README on the topic. Most of these will not come in use, if you are working at the school. Most of the required programs are already installed on the school computers, and those are included in the subjects as well.

## For those who plan on using Windows

For those who haven't already noticed, 42 curriculum which Hive is using, is a Unix based. All the school projects are somewhat associated with Linux or OSX. School computers are Macintoshes. All the commands you will see in the courses are run in these environments. So, if you insist on working on your own laptop and using Windows, you will need to keep this in mind, why this or that command is not available in Windows. Also, exams are done on school computers. It will be much easier for you, if you just install a virtual computer on your laptop, or perhaps do a dual booting system, if you feel that Linux might be your choice. Linux in all it's distributions may seem intimidating at first, but once you get a hang of it, it's far more faster to get on track with all the projects.  You don't see 27" iMacs handed to student use everywhere, so take advantage of it. All in all, school is all about peer learning, and the best way to learn from your peers is to see them day by day at school.

## Package manager for OSX

To install Homebrew package manager for OSX, you'll need to run

	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

More info at [Homebrew](https://brew.sh/)

## How to get a ssh key and how to add it to your Github

[Github has a great documentation about creating ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), but I'm going to repeat those!

First create a ssh key:

`ssh-keygen -f ~/.ssh/my-key -t ed25519 -C "your_email@example.com"`

More about ssh keys can be found at [ssh.com](https://www.ssh.com/academy/ssh/keygen)

Option | What it does
-------|-------------
`-f` | tells you the output location and name of the file.
`-t` | option here states the type of the algorithm used in the creation of the key and
`-C` | is the comment for the file, usually the host of the key.

Start ssh-agent at background, if it is not already running.

`eval "$(ssh-agent -s)"`

To add your new lovely key to your keychain, you'll need to write following command:

`ssh-add ~/.ssh/my-key`

This tells your `ssh-agent` program to hang in the keychain, so that is available to use.

From here onwards, it's silly to repeat what octocat has said. So, [check these out!](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

## VSCode Shortcuts (originally posted to discord by )

Command | What it does
--------|-------------
cmd/ctrl + k + c | comment selected lines
cmd/ctrl + k + u | uncomment selected lines
cmd/ctrl + d | every time you press it, when are in you find&select mode, it will go to next occurance (really useful for changing variable names)
option/alt + shift + up/down-arrow | copy the line you are on before or after it depending the arrow key you pressed
option/alt + up/down-arrow | move line up and down
cmd/ctrl + p | opens a search bar that you can find files (so no need to use mouse for opening files :p)
cmd/ctrl + shift + p | opens a search bar for multiple commands
option/alt + shift + f | automatic formatting (if you have installed the norm extension it follows it)
cmd/ctrl + shift + v | opens markdown file to preview mode, so you can view how it looks like in browser.

Originally posted by: leila

## How to get VSCode working like Vim/Emacs at school
- Install this plug-in to generate school header with
https://marketplace.visualstudio.com/items?itemName=kube.42header

- Match editor settings with school environment (tabs, whitespace etc.) and to render right log-in details in header:
- Find VS Code settings file at ~/Library/Application Support/Code/User/settings.json
- Paste following inside the curly bracers:

	"42header.username": "smarvin"
	"42header.email": "smarvin@student.hive.fi",
	"editor.insertSpaces": false,
	"editor.renderWhitespace": "all",
	"files.trimTrailingWhitespace": true,
	"files.insertFinalNewline": true,

Originally posted by: jkoskela

## Emacs tips
Config | What it does
-------|-----------
(add-hook 'before-save-hook 'whitespace-cleanup) | This should take care of whitespace at the beginning of the file, end of lines and multiple empy lines at the end of the file.
(setq backward-delete-char-untabify-method 'hungry) | You can change the emacs backspace key behaviour when deleting tab characters by adding this.

## Vim tips
You can create `.vimrc` file to your user home directory to make your vimming easier:
Config | What it does
-------|--------
syntax on | adds colours to easier grasp what is a function etc.
set tabstop=4 | sets tabulation to exactly 4 spaces long
set number | sets row numbering on

Commands | What it does
---------|------------
: | enter to menu
:wq | write to the file and quit
:q | quit
:q! | quit and don't save
i | input on
v | visual on
esc | exit from input or visual mode
v + arrow keys | while visual mode is on, you can select rows of text.
v + y | while visual mode is on you can copy or "yank" text.
v + d | while visual mode is on, you can delete selected text by pressing d.
p | put down the text you've copied.
u | undo the stuff you've done.



## Links to interesting topics

### Floats
[Floating point visually explained](https://fabiensanglard.net/floating_point_visually_explained/index.php)
[Find and fix floating-point problems](https://herbie.uwplse.org/)

### Vectors and matrices
[3Blue1Brown: Vectors | Chapter 1, Essence of linear algebra](https://www.youtube.com/watch?v=fNk_zzaMoSs&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab)
Originally tipped by: ngontjar

[Tracy Profiler. A real time, nanosecond resolution, remote telemetry, hybrid frame and sampling profiler for games and other applications](https://github.com/wolfpld/tracy)

## Tutorials

Link | What
-----|-----
[Crash Course](https://www.youtube.com/user/crashcourse) | Tons of awesome animated courses initially founded by well known vlogbrothers. I've watched courses on history and media literacy.
[Educative](https://educative.io) | Courses for many programming languages. Free 6 months from Github Student pack.
[Lazy Foo SDL tutorial](http://lazyfoo.net/tutorials/SDL/index.php) | Great tutorial on SDL2. SDL2 can be used to create games and graphical interfaces for C projects
[Automate the Boring Stuff with Python](https://automatetheboringstuff.com/) | Free ebook that teaches the very basics of python, great starting point for learning the language
[Elements of AI](https://course.elementsofai.com/) | Does not contain any programming, but still a very useful course for learning what AI is and how it can be used in our lives
[freeCodeCamp](https://www.freecodecamp.org/) | Very beginner friendly bootcamp for learning HTML, CSS, Javascript, data visualization and APIs. However it's a bit slow in my opinion, it's really made for people with no prior knowledge in coding
[Tour of Go](https://tour.golang.org/welcome/1) | Offical Go tour
[Go by Example](https://gobyexample.com/) | Short and useful Go examples
[Build Web Application with Golang](https://astaxie.gitbooks.io/build-web-application-with-golang/content/en/) | Great e-book about writing web app in Go
[Effective Go](https://golang.org/doc/effective_go.html) | Good to know about Go
[LiveOverflow](https://www.youtube.com/channel/UClcE-kVhqyiHCcjYwcpfj9w) | Hacking, pentesting & reverse engineering explained in fun videos
[OneLoneCoder](https://www.youtube.com/channel/UC-yuWVUplUJZvieEligKBkA) | Oldschool c++ guy doing game programming videos
[Grasshopper](https://grasshopper.app/) | learn javascript
[Udacity](https://www.udacity.com) | Courses on multiple tech subjects, including AI, Cloud Computing, Data Science, Blockchain Technology and many more.
[One Month](https://onemonth.com/) | Multiple courses including Python, HMTL&CSS, Wordpress etc. Something to relax to when not that serious about stuff and just want to have general idea of language. Level: Really easy (free for a month as GitHub Student pack).
[leetcode](https://leetcode.com/) | There are 1397  interview problems and so on.
[Getting started with react hooks](https://www.vtnetzwelt.com/web/getting-started-with-react-hooks/) |  A great intro to react hooks.
[Helsinki University Open Fullstack course](https://fullstackopen.com/en/) | Learn React, Redux, Node.js, MongoDB, and GraphQL in one go! This course will introduce you to modern JavaScript-based web development. The main focus is on building single page applications with ReactJS that use REST APIs built with Node.js.
[Google PWA training](https://www.youtube.com/watch?v=psB_Pjwhbxo&list=PLNYkxOF6rcIB2xHBZ7opgc2Mv009X87Hh) | What is a PWA and why should you care? This is a course by google that introduces you to PWA's, client side caching and more.
[The world's largest web developer site](https://www.w3schools.com/) | Good basic things with examples, how to get SQL database connection with PHP, javascript, HTML and CSS tutorials etc.
[Helsinki University DevOps with Docker](https://devopswithdocker.com/) | DevOps course by University of Helsinki
[BSP algorithm](https://www.geeksforgeeks.org/binary-space-partitioning/)
