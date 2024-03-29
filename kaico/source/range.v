// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
module source

// Range represents a range in a `Source`.
@[noinit]
pub struct Range {
pub:
	begin Pos
	end   Pos
}

// Range.new creates a new `Range` between `p1` and `p2`
pub fn Range.new(p1 Pos, p2 Pos) Range {
	begin, end := if p1 <= p2 { p1, p2 } else { p2, p1 }
	return Range{begin, end}
}

// source returns the `Source` of `Range`
pub fn (r Range) source() &Source {
	return r.begin.source
}

// len returns the length of the `Range`
pub fn (r Range) len() int {
	return r.end.offset - r.begin.offset
}

// text returns the text between `begin` and `end` of the `Range`
pub fn (r Range) text() string {
	return r.source().code[r.begin.offset..r.end.offset]
}

// extend returns a new `Range` that extends the `Range` with `p`
pub fn (r Range) extend(p Pos) Range {
	return if p < r.begin {
		Range.new(p, r.end)
	} else if r.end < p {
		Range.new(r.begin, p)
	} else {
		r
	}
}

// contains returns true if the `Range` contains the another `Range`
pub fn (r Range) contains(target Range) bool {
	begin, end := target.begin, target.end
	return begin.in_range(r) && (end == r.end || end.in_range(r))
}
