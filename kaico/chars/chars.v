// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
module chars

pub const (
	whitespaces = [' ', '\t', '\n', '\r', '　']
)

// Char represents single utf-8 char
pub type Char = string

pub fn Char.new(c string) Char {
	return c
}

// Chars represents Char sequence
pub type Chars = string

pub fn Chars.new(c string) Chars {
	return c
}

pub fn (c Chars) at(i int) Char {
	return Char(c[i..i + utf8_char_len(c[i])])
}

// ======
// is_xxx
// ======

pub fn (c Char) is_ascii() bool {
	return c.len == 1
}

fn (c Char) is_ascii_between(c1 u8, c2 u8) bool {
	return c.is_ascii() && c1 <= c[0] && c[0] <= c2
}

pub fn (c Char) is_digit() bool {
	return c.is_ascii_between(`0`, `9`)
}

pub fn (c Char) is_lower_alphabet() bool {
	return c.is_ascii_between(`a`, `z`)
}

pub fn (c Char) is_upper_alphabet() bool {
	return c.is_ascii_between(`A`, `Z`)
}

pub fn (c Char) is_alphabet() bool {
	return c.is_upper_alphabet() || c.is_lower_alphabet()
}

pub fn (c Char) is_ident() bool {
	return c.is_ident_first() || c.is_digit()
}

pub fn (c Char) is_ident_first() bool {
	return c.is_ascii() && (c[0] == `_` || c.is_alphabet())
}

pub fn (c Char) is_whitespace() bool {
	return c in chars.whitespaces
}
