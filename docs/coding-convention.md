# Coding conventions

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
