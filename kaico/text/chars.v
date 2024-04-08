// SPDX-License-Identifier: MPL-2.0
//
// Copyright 2021-2024 zakuro <z@kuro.red> (https://x.com/zakuro9715)
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
module text

pub const whitespaces = [' ', '\t', '\n', '\r', '　']!

// Char represents single utf-8 char
pub type Char = string

// Char.new creates Char from string that contains only one utf-8 char
pub fn Char.new(c string) Char {
	return c
}

// Chars represents Char sequence
pub type Chars = string

// Chars.new creates Chars from string that contains utf-8 chars
pub fn Chars.new(c string) Chars {
	return c
}

// at returns Char at i-th position
pub fn (c Chars) at(i int) Char {
	return Char(c[i..i + utf8_char_len(c[i])])
}

// ======
// is_xxx
// ======

// is_ascii returns true if `c` is ascii char
pub fn (c Char) is_ascii() bool {
	return c.len == 1
}

// is_ascii_between returns true if `c` is ascii char and its code is between `c1` and `c2`
fn (c Char) is_ascii_between(c1 u8, c2 u8) bool {
	return c.is_ascii() && c1 <= c[0] && c[0] <= c2
}

// is_digit returns true if `c` is digit
pub fn (c Char) is_digit() bool {
	return c.is_ascii_between(`0`, `9`)
}

// is_lower_alphabet returns true if `c` is between `a` and `z`
pub fn (c Char) is_lower_alphabet() bool {
	return c.is_ascii_between(`a`, `z`)
}

// is_upper_alphabet returns true if `c` is between `A` and `Z`
pub fn (c Char) is_upper_alphabet() bool {
	return c.is_ascii_between(`A`, `Z`)
}

// is_alphabet returns true if `c` is upper or lower alphabet
pub fn (c Char) is_alphabet() bool {
	return c.is_upper_alphabet() || c.is_lower_alphabet()
}

// is_ident returns true if `c` can be used as identifier
pub fn (c Char) is_ident() bool {
	return c.is_ident_first() || c.is_digit()
}

// is_ident_first returns true if `c` can be used as first char of identifier
pub fn (c Char) is_ident_first() bool {
	return c.is_ascii() && (c[0] == `_` || c.is_alphabet())
}

// is_whitespace returns true if `c` is whitespace
pub fn (c Char) is_whitespace() bool {
	return c in text.whitespaces
}
