// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
module token

import kaico.source { Range }
import kaico.utils { unwrap_none }

pub enum TokenKind {
	int_literal
}

pub struct Token {
pub:
	kind  TokenKind
	range Range
}

pub fn (t Token) text() string {
	s := unwrap_none(t.range.source())
	return s.code[t.range.begin.offset..t.range.end.offset]
}
