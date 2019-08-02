# Command line Java IDE

# How to use

~~~
script/flow.sh
~~~

# What it does

It displays one line:

~~~
gradle: [c]ompileTestJava, [r]un, spotless[A]pply, [b]uild. [R]eports. [v]im. [V]iew in ranger. tig s[t]atus. git rebase -i HEAD~[2].
~~~

Just press a key to run a task.

# Why?

## The good

- It is fast
- It needs little memory
- It works in a terminal
- It does 90% of what a desktop IDE does
- It is easy to modify

## The bad

- The code index is less precise than an desktop IDE's

# Typical workflow

1. Press "c" to compile and test
2. Any errors will be shown in Vim, press "gf" to jump to the file
3. Fix the code
4. Press "c" to compile and test again
5. Press "A" to format all the code
6. Press "b" to build
7. Press "R" to check the static analysis and test results
8. Finally, use the package in "build/distributions/" for a release

# Tools in use

- OpenJDK 11
- Gradle
- Vim
- GNU Global
- Git
- Ranger
- w3m

# Hidden features

To create a standalone JVM:

~~~
script/create-standalone-jvm.sh
~~~

To extract sources & javadoc of a library, for example, Guava:

~~~
script/extract-sources-and-javadoc.sh com.google.guava:guava:27.0.1-jre
~~~

