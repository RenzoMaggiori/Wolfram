# Wolfram

## Overview

Wolfram is a project aimed at implementing Wolfram's elementary cellular automaton in the terminal using Haskell. The elementary cellular automaton follows rules 30, 90, and 110. The cellular automaton exists in an infinite space, allowing unseen parts to affect future generations.

## Features

- **Elementary Cellular Automaton:** Implements Wolfram's elementary cellular automaton with support for rules 30, 90, and 110.
- **Infinite Space:** The cellular automaton exists in an infinite space, allowing for unseen parts to affect future generations.
- **Options:** Supports various options including specifying the ruleset, starting generation, number of lines to display, line width, and translation of the window.
- **Clean Code:** Encourages the use of Haskell's features such as pattern matching, guards, partial application, higher-order functions, and closures to produce clean and functional code.

## Invocation

The program supports the following options:

- `--rule`: Specifies the ruleset to use (mandatory).
- `--start`: Specifies the generation number at which to start the display (default: 0).
- `--lines`: Specifies the number of lines to display (optional).
- `--window`: Specifies the number of cells to display on each line (default: 80).
- `--move`: Specifies a translation to apply on the window (optional).

## Build with Stack

Stack is used as the build tool/package manager for Haskell. Ensure the following:

- Use version 2.1.3 or higher.
- Utilize the hpack variant.
- Use a version in the LTS 20 series.
- Restrict dependencies to base only in the lib and executable sections.
- Provide a Makefile that builds the stack project.

## Installation & Usage

To compile Wolfram, use the provided Makefile. Make sure to include all necessary source files, excluding unnecessary files like binaries, temporary files, or object files. After compiling Wolfram, you can run it with a `--rule` parameter.

## Example
```
./Wolfram.exe --rule 30 --lines 10  
                                        *
                                       ***
                                      **  *
                                     ** ****
                                    **  *   *
                                   ** **** ***
                                  **  *    *  *
                                 ** ****  ******
                                **  *   ***     *
                               ** **** **  *   ***
```

## Tests
<div align="center">
  <img src="./test/tests.png" />
</div>

## License

Wolfram was developed by [Renzo Maggiori](https://github.com/RenzoMaggiori). Feel free to use, modify, and distribute it.
