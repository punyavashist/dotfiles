#[modal editing is ✨](https://my.mindnode.com/dsyhczzfLsBAG4EpFt5TZnBYWAD9mfc9ms7nPMCz)

![](http://i.imgur.com/73ko1QL.jpg)

##mindmap index

### read

- [definitive guide](http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/)


# neat


## in normal mode

### vi(

- inside brackets, go to visual mode and select text inside the brackets

- where ( can be any other symbol

### va(

- inside brackets, go to visual mode and select text AND the brackets

## search and replace

### :%s/foo/bar/g

- in all lines

- find each occurrence of ‘foo’

- replace with bar


# terms


## text objects

### are blocks of text with a starting and ending point

### when you use a motion, conceive of that as an operation that is creating a dynamic text object that is delimited by the starting and ending cursor position

## [buffers](http://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/)

### is text that you are editing

### i.e. when you open a file, the content of the file is loaded into a buffer


# macros


# tricks


# normal mode


## (⇧) shift mappings

### ⇧ + v

- visually select current line

	- then can move up and down with j k

	- ⇧ + v n j

		- visually select next n lines

	- ⇧ + v n k

		- visually select previous n lines

## commands

### d

- delete

- df<x>

	- delete until next x

- dF<x>

	- delete until previous x

- dt<x>

	- delete until x

### f

- f<char>

	- will go to next character

- F<char>

	- will go to previous character

## useful

### go to beginning of line

- ^

	- moves the cursor to the first non-blank character of a line

- 0

	- always moves the cursor to the "first column"

- can also use ⇧ + I

	- to move and switch to insert mode

## ^

### jump to start of line

## $

### jump to end of line

## G

### jump to end of file

### 2G

- jump to line 2

- where 2 is number of lines

## w

### go forward one word

## b

### go back one word

## x

### delete sign under cursor

## dd

### delete line

## d

### works like cut

## y

### yank = copy

## p

### paste

## Y

### copy line

## i

### insert mode at cursor position

## a

### insert mode at next cursor position

## A

### insert at the end of line

## o

### insert in next line

## O

### insert in before line

## v

### go to visual mode


# resources


## text objects

### [definitive guide](http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/)


# insert


# visual mode


## v/foo

### will select from my current position to the next instance of “foo”

## V

### go to visual line mode (one line at a time)

