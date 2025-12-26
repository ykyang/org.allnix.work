
TODO: format, link
Modern C: `https://livebook.manning.com/book/modern-c-third-edition`

## Compile

Compile `hello.c`

On Linux

```sh
gcc hello.c -o hello
```

On Windows, in a `Developer Command Prompt for VS` with Microsoft compiler

```default
cl hello.c /Fe: hello
```

or with `clang` compiler

```default
clang-cl hello.c -o hello
```

1.1 Imperative programming

1.2 Compiling and running

`-Werror`

2 The principal structure of a program

`syntactical aspects`, `semantic aspects`

2.1 Grammar

Special words, Punctuation, Comments, Literals, 

* Identifiers: `argc`, `A`, `printf`
* Functions: `main()`, `printf()`
* Operators: `=`, `<`
* Attributes: `[[maybe_unused]]`

2.2 Declarations

* `apropos`
* `man 3 printf`

2.3 Definitions

Designated initializer
```c
double A[5] = {
    [0] = 9.0, [1] = 2.9,
    [4] = 3.0e25,
    [3] = 0.00007,
};
```

2.4 Statements

Level 1: Acquaintance and Buckle up

```c
char const* const path_name[[deprecated]];
```

3.1 Conditional execution

controlling expression, secondary block

3.2 Iterations

Heron approximation

3.3 Multiple selection

