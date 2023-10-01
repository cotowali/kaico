// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
module source

[noinit]
pub struct Pos {
pub:
	source &Source

	offset int [required]
	line   int [required]
	column int [required]
}

[params]
pub struct PosParams {
	offset int [required]
	line   int [required]
	column int [required]
}

pub fn (s &Source) new_pos(pos PosParams) Pos {
	return Pos{
		source: s
		offset: pos.offset
		line: pos.line
		column: pos.column
	}
}

fn (lhs Pos) < (rhs Pos) bool {
	return lhs.offset < rhs.offset
}

fn (lhs Pos) == (rhs Pos) bool {
	return lhs.offset == rhs.offset
}
