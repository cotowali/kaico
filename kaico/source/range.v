// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
module source

pub struct Range {
pub:
	begin Pos
	end   Pos
}

pub fn Range.new(p1 Pos, p2 Pos) Range {
	begin, end := if p1 <= p2 { p1, p2 } else { p2, p1 }
	return Range{begin, end}
}

pub fn (r Range) source() ?&Source {
	return r.begin.source?
}

pub fn (r Range) len() int {
	return r.end.offset - r.begin.offset
}

pub fn (r Range) extend(p Pos) Range {
	return if p < r.begin {
		Range.new(p, r.end)
	} else if r.end < p {
		Range.new(r.begin, p)
	} else {
		r
	}
}
