# Coding conventions

## File

### File Header

- ALL files MUST starts with [license](../snippets/license.vv)

### Section Header

- File CAN contain section header for readability.
- Section header MUST be same as example.
- Section MUST NOT be nested.
- Section MUST NOT have closing comment.

```
// =====
// const
// =====

const v = 0

// ========
// function
// ========

// Here is v doc comment
fn f() {}
```

## Struct

### New method

- Struct SHOULD have `Foo.new` and/or `from_xxx`
- That struct SHUOLD be `[noinit]`
- `Foo.new` MAY receives `FooParams`


```
[noinit]
pub struct Foo {
pub:
    foo string
}

[params]
pub struct FooParams {
pub:
    foo string
}

pub fn Foo.new(params FooParams) Foo {
    return Foo{
        foo: params.foo
    }
}

pub fn Foo.from_foo(foo: string) Foo {
    return Foo{
        foo: foo
    }
}
```

# Params

Name of `[params]` struct SHOULD have suffix, `Params`

```
[params]
pub struct FooParams {
pub:
    foo string
}

pub fn foo(params FooParams) {
    // ...
}
```
