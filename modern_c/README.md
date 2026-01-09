
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

4.1 Operands and operators

4.2 Arithmetic

overflow, wraps around the range of the type

4.3 Operators that modify objects

4.4 Boolean context

comparisons and logical evaluation

5.1 The abstract state machine

5.2 Basic types

* unsigned integer
* signed integer
* real floating-point number
* complex floating-point number

5.3 Specifying values

* Decimal integer: `123 = 123`
* Octal integer: `037 = 63`
* Hexadecimal integer: `0xffff = 65535`
* Binary integer: `0b1010 = 10`
* Decimal floating-point: `1.7e-3 = 0.0017`
* Hexadecimal floating-point: `0x1.7aP-3 = 0.18457`
* Integer character: `a`
* String: "hello"

TODO 5.4 Implicit conversions

5.5 Initializers

```c
    // PRIuPTR is a portable printf specifier see inttypes.h
    double a = {}; // a == 0
    double c = {7.8};
    double A[] = {3, }; printf("Length of A: %" PRIuPTR "\n", sizeof(A)/sizeof(double));
    double B[3] = {1, 2, 3}; printf("Length of B: %" PRIuPTR "\n", sizeof(B)/sizeof(double));
    double C[] = {[0]=6, [3] = 1,}; printf("Length of C: %" PRIuPTR "\n", sizeof(C)/sizeof(double));
```

5.6 Named constants

**Compound literals**

```c
# define CORVID_NAME /**/         \
(char const*const[corvid_num]){   \
  [chough] = "chough",            \
  [raven] = "raven",              \
  [magpie] = "magpie",            \
  [jay] = "jay",                  \
}
```

**The `constexpr` construct**

```c
# define CORVID_NAMES /**/         \
(constexpr char[8][corvid_num]){   \
  [chough] = "chough",             \
  [raven] = "raven",               \
  [magpie] = "magpie",             \
  [jay] = "jay",                   \
}
```

TODO 5.7 Binary representations