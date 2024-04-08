// SPDX-License-Identifier: MPL-2.0
//
// Copyright 2021-2024 zakuro <z@kuro.red> (https://x.com/zakuro9715)
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
module token

import kaico.source { Range }
import kaico.utils { unwrap_none }

// ---
// int
// ---

pub enum IntBase {
	binary  = 2
	octal   = 8
	decimal = 10
	hex     = 16
}

pub struct Int {
pub:
	base  IntBase
	value i64
}

pub fn Token.new_int(base IntBase, value i64, range Range) Token {
	return Token.new_literal(Int{
		base: base
		value: value
	}, range)
}

// ----
// bool
// ----

pub enum Bool {
	true_
	false_
}

pub fn Token.new_bool(kind Bool, range Range) Token {
	return Token.new_literal(kind, range)
}

pub type Literal = Bool | Int

pub enum Operator {
	add
	sub
	mul
	div
}

// -------
// unknown
// -------

pub struct Unknown {}

pub fn Token.new_literal(literal Literal, range Range) Token {
	return Token.new(literal, range)
}

pub fn Token.new_operator(op Operator, range Range) Token {
	return Token.new(op, range)
}

pub fn Token.new_unknown(range Range) Token {
	return Token.new(Unknown{}, range)
}

// -----
// token
// -----

pub type TokenKind = Literal | Operator | Unknown

@[noinit]
pub struct Token {
pub:
	kind  TokenKind
	range Range
}

pub fn Token.new(kind TokenKind, range Range) Token {
	return Token{
		kind: kind
		range: range
	}
}

pub fn (t Token) text() string {
	s := unwrap_none(t.range.source())
	return s.code[t.range.begin.offset..t.range.end.offset]
}
