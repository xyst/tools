# Command line Java IDE

## How to use

~~~
script/flow.sh
~~~

## What it does

It displays one line:

~~~
gradle: [c]ompileTestJava, [r]un, spotless[A]pply, [b]uild. [R]eports. [v]im. [V]iew in ranger. tig s[t]atus. git rebase -i HEAD~[2].
~~~

Just press a key to run a task.

## Why?

It is fast, needs little memory, and works in a terminal.

It does 90% of what a desktop IDE does (for me), and is easy to modify.

Drawback: a desktop IDE has more precise code index.

## Typical workflow

1. Press `c` to compile
2. Any errors will be shown in Vim, press `gf` to jump to the file
3. Fix the code
4. Press `c` to compile again
5. Press `A` to format the code
6. Press `b` to build
7. Press `R` for the results of static analysis and tests
8. Press `t` to stage/commit in Git
8. Finally, use the package in `build/distributions/` for a release

## Tools in use

- OpenJDK 11
- Gradle - build system
- Vim - editor
- GNU Global - code index
- Spotless - code format
- Git and Tig - version control
- Ranger - directory browser

## Hidden features

To create a standalone JVM:

~~~
script/create-standalone-jvm.sh
~~~

To extract sources & javadoc of a library, for example, Guava:

~~~
script/extract-sources-and-javadoc.sh com.google.guava:guava:27.0.1-jre
~~~

## Useful keys

### Vim with GNU Global

- `gf` to open file name
- `Ctrl-w gf` to open file name in new tab
- `Ctrl-]` to open definition
- `Ctrl-w Ctrl-]` to open definition in new tab
- `:cs find g name` to find a class/method by name

### Tig

- `u` to stage
- `c` to commit
- `!` to discard a change
- `m` to show history
- `s` to show status
- `j` and `k` to walk in the diff
- `q` to quit

### Ranger

- `:touch name` to create a file
- `a` to rename a file
- `:mkdir name` to create a directory
- `Space` to select files
- `dd` and `pp` to move files
- `q` to quit

## Relevant

Unix as IDE  
<https://sanctum.geek.nz/arabesque/series/unix-as-ide/>

Learn Vim Progressively  
<https://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/>

GNU Global  
<https://www.gnu.org/software/global/globaldoc_toc.html#Vim-editor>
