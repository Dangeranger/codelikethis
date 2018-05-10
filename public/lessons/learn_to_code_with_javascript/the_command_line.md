# The Command Line

* the **TERMINAL** is a window into which you can talk directly to your computer
  * aka *console* or *command line* or *command prompt* or *shell*

![Shall we play a game?](../images/wargames-terminal.jpg)

<small>from WarGames, (1983)</small>

* when you type into the terminal, you are issuing **COMMANDS** to the computer
* a *CLI* (Command Line Interface) is different from the *GUI* (Graphical User Interface) you are used to
  * more primitive
  * more powerful

# Opening the Terminal

* to open your Terminal:
  * Mac OS: launch the "Terminal" application
  * Windows: launch "Windows PowerShell"
* **Important:** make your terminal *as **tall** as possible*
  * errors are often long and you want to start reading at the very top without scrolling
  * make it look like this:

![terminal next to browser](../images/terminal-and-browser.png)


# Lab: Interactive Calculator

1. open a terminal
2. type `node` -- that's you *commanding* the computer to launch *node*
1. press the `return` key (also called `enter`)
1. see the `>` prompt
1. type `1 + 1`
1. press the `return` key again
1. see the `2`

* Yay! Your computer is an expensive calculator!
* **Bonus**: what other math can you do?

## node is an interactive JavaScript interpreter

* From now on, whenever you see text in the `code font`, try typing it into the terminal and see what happens!

# Directories

* a DIRECTORY is a location on your hard disk
  * also called a FOLDER
* directories can contain FILES
* directories can also contain other directories (called SUBDIRECTORIES)

# The Current Directory

* inside the Terminal, you are *always* inside a directory
* it is very important not to get lost! You must try to remember which directory you are in.
* If you forget, you can use a special command called `pwd`

# Home Directory

* when you first open the Terminal you are in your HOME DIRECTORY
* usually you don't want to store files directly in here

# Listing Directory Contents

* when you type `ls` ("list") it shows the contents of the current directory
  * **On Windows** you might need to type `dir` instead

# Making a directory

* when you type `mkdir` ("make directory") it creates a new SUBDIRECTORY inside the current directory

        mkdir code

# Changing directories

* `cd` ("change dir") moves you into a different directory
* For example, `cd code` would move you into a subdirectory named `code`
* If you ever get lost, type `cd` all on its own and press the return key. This will send you back to your home directory.
  * (unix shell only, not Windows)

# Basic Command Line Glossary

* `pwd` ("print working dir") -- shows the name of the current directory
* `ls` ("list") -- shows the contents of the current directory
* `mkdir` ("make dir") -- creates a new SUBDIRECTORY inside the current directory
* `cd` ("change dir") -- move into a different directory

> These apply to Unix shells, but most work in Windows too


# LAB: make a subdirectory and then enter it

1. open Terminal
2. make a new subdirectory using `mkdir code`
3. change into that directory using `cd code`
4. list its contents using `ls` (and note that it's empty)
  * **On Windows** you might need to type `dir` instead of `ls`

# Files

* a file is a place on disk for storing stuff
* "stuff" here could be anything at all
  * documents, pictures, sounds, applications...
* every file lives inside a directory

# Text Editor

* a text editor is a program that edits a text file
* a text editor is *like* a word processor
* but a text editor is **not** a word processor
* You probably have *VS Code* <https://code.visualstudio.com/>
  * others include *TextMate*, *Notepad++*, *Sublime Text*, *Vim*, *Emacs*, *Atom*
  * but **NOT** *TextEdit* or *Notepad* or *Microsoft Word*

# Source File

* source code is the essence of a program
* source files are text files that contain source code
* to **RUN** a JavaScript program you type `node` and then the name of the source file

* The Recipe Metaphor
  * source file = recipe
  * running = cooking

# LAB: Hello, World

1. Make sure you are in your `code` subdirectory using `pwd`
2. Open this directory 
  * for Atom, use `atom .`
  * for VSCode, use `code .`
3. Create a file named `hello.js` using the *File > New* menu
4. Inside this file, put the following source code:

        console.log("Hello, World!");

5. Save the file
6. Go back to the terminal
7. Run this file using `node hello.js`

What happens? Is this what you expected?

# Shortcuts

![bash shortcuts](../images/bash-cursor-shortcuts.jpg)

also:

* use ESC instead of ALT for the above
* ESC-Backspace (delete previous word)
* up/down arrow (scroll through history)

# Next Steps

See <https://www.learnenough.com/command-line-tutorial> for a great command-line tutorial.
