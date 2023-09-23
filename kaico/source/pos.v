// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
module source

pub struct Pos {
pub:
	source ?&Source

	offset int [required]
	line   int [required]
	column int [required]
}

pub fn (lhs Pos) < (rhs Pos) bool {
	return lhs.offset < rhs.offset
}

pub fn (lhs Pos) == (rhs Pos) bool {
	return lhs.offset == rhs.offset
}
