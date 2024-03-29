// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.source { Range, Source }

const s = Source.from_text('abcdef')
const p0 = s.new_pos(offset: 0, line: 1, column: 1)
const p1 = s.new_pos(offset: 1, line: 1, column: 2)
const p2 = s.new_pos(offset: 2, line: 1, column: 3)
const p3 = s.new_pos(offset: 3, line: 1, column: 4)
const p4 = s.new_pos(offset: 4, line: 1, column: 5)
const p5 = s.new_pos(offset: 5, line: 1, column: 6)

fn test_new() {
	r1 := Range.new(p1, p2)
	r2 := Range.new(p2, p1)
	assert r1.begin == p1
	assert r2.begin == p1
	assert r1.end == p2
	assert r2.end == p2
}

fn test_op() {
	assert Range.new(p1, p2) == Range.new(p2, p1)
	assert Range.new(p1, p2) != Range.new(p2, p3)
}

fn test_len() {
	assert Range.new(p1, p3).len() == p3.offset - p1.offset
}

fn test_source() {
	assert Range.new(p1, p2).source() == p1.source
}

fn test_text() {
	assert p1.source.code == 'abcdef'
	assert p1.offset == 1 && p3.offset == 3
	assert Range.new(p1, p3).text() == 'bc'
	assert Range.new(p2, p5).text() == 'cde'
}

fn test_extend() {
	assert Range.new(p1, p2).extend(p3) == Range.new(p1, p3)
	assert Range.new(p1, p2).extend(p0) == Range.new(p0, p2)

	assert Range.new(p1, p2).extend(p1) == Range.new(p1, p2)
	assert Range.new(p1, p2).extend(p2) == Range.new(p1, p2)
}

fn test_contains() {
	r13 := Range.new(p1, p3)
	assert r13.contains(r13)

	assert !r13.contains(Range.new(p0, p1))
	assert !r13.contains(Range.new(p0, p2))
	assert !r13.contains(Range.new(p0, p3))
	assert !r13.contains(Range.new(p0, p4))
	assert !r13.contains(Range.new(p0, p5))

	assert r13.contains(Range.new(p1, p2))
	assert r13.contains(Range.new(p1, p3))
	assert !r13.contains(Range.new(p1, p4))
	assert !r13.contains(Range.new(p1, p5))

	assert r13.contains(Range.new(p2, p3))
	assert !r13.contains(Range.new(p2, p4))
	assert !r13.contains(Range.new(p2, p5))

	assert !r13.contains(Range.new(p3, p4))
	assert !r13.contains(Range.new(p3, p5))

	assert !r13.contains(Range.new(p4, p5))
}
