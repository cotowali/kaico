// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.token as _ {
	Bool,
	Int,
	Literal,
	Operator,
	Token,
	TokenKind,
	Unknown,
}
import kaico.source as _ { Range, Source }

fn test_text() {
	s := Source.from_text('0 23 4')
	r := Range.new(s.new_pos(offset: 2, line: 1, column: 3), s.new_pos(offset: 4, line: 1, column: 5))
	t := Token.new_int(.decimal, 23, r)
	assert t.text() == '23'
}

fn test_new() {
	range_for := fn (text string) Range {
		s := Source.from_text(text)
		n := text.len
		p1 := s.new_pos(offset: 0, line: 1, column: 1)
		p2 := s.new_pos(offset: n, line: 1, column: n + 1)
		return Range.new(p1, p2)
	}

	lit := Token.new_literal(Bool.true_, range_for('true'))
	assert lit.kind == TokenKind(Literal(Bool.true_))

	int_d := Token.new_int(.decimal, 1, range_for('0b1'))
	assert int_d.kind is Literal
	assert (int_d.kind as Literal) is Int
	assert ((int_d.kind as Literal) as Int).base == .decimal

	bool_true := Token.new_bool(.true_, range_for('true'))
	assert bool_true.kind is Literal
	assert (bool_true.kind as Literal) is Bool
	assert (bool_true.kind as Literal) as Bool == .true_

	op := Token.new_operator(.add, range_for('+'))
	assert op.kind is Operator
	assert op.kind as Operator == .add

	un := Token.new_unknown(range_for(' '))
	assert un.kind is Unknown
}
