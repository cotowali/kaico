# Coding conventions

- We define coding convetions for unified code.
- Coding conventions should be defined in detail.
- When writing code, if a rule doesn't exist, define a new one.

## File

### File Header

- ALL files MUST starts with [license](../snippets/license.vv)

### Section Header

- File CAN contain section header for readability.
- Section header MUST be same as example.
- Section MUST NOT be nested.
- Section MUST NOT have closing comment.

```v
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

```v
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

### Params

Name of `[params]` struct SHOULD have suffix, `Params`

```v
[params]
pub struct FooParams {
pub:
    foo string
}

pub fn foo(params FooParams) {
    // ...
}
```

### Property function

- Property functions signature MUST be `name() Type` or `name() ?Type` or `name() !Type`
- Property functions MUST NOT have `get_` prefix

```
struct Message {
pub:
    sender string
    text string
}

fn (m Message) full_text() string {
    return '${m.sender}: ${m.text}'
}

struct Message2 {
pub:
    sender ?string
    text ?string
}

fn (m Message2) full_text() ?string {
    return '${m.sender?}: ${m.text?}'
}

struct Message3 {
pub:
    sender !string
    text !string
}

fn (m PartialMessage) full_text() !string {
    return '${m.sender!}: ${m.text!}'

}

```

## Documentation Comment

- public item MUST have documentation.
- Documentation MUST ends with `.`
- Function, struct, variable and other names MUST be `` `name` ``
- Normal structs documentation SHOULD be `Struct represents ...`
- [Params struct](#params) documentation SHOULD be ``FooParams is the parameters for `Foo.new`. ``
- [Struct.new](#new-method) documentation SHOULD be `Struct.new creates ...`
- [Property](#property-function) documentations SHOULD be `value returns ...`


```
// Message represents a message.
[noinit]
struct Message {
pub:
    sender string
    text string
}

// MessageParams is the parameters for `Message.new`.
struct Message {
pub:
    sender string
    text string
}

// Message.new creates `Message`.
fn Message.new(p MessageParams) Message {
    return Message {
        sender: p.sender
        text: p.text
    }
}

// Message.from_text creates `Message` from `text`.
fn Message.from_text(text: string) Message {
    return Message.new(sender: '', text: text)
}

// full_text returns the full text.
fn (m Message) full_text() string {
    return '${m.sender}: ${m.text}'
}
```
