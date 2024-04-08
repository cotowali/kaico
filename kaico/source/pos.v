// SPDX-License-Identifier: MPL-2.0
//
// Copyright 2021-2024 zakuro <z@kuro.red> (https://x.com/zakuro9715)
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
module source

// Pos represents a position in a `Source`.
@[noinit]
pub struct Pos {
pub:
	source &Source

	offset int @[required]
	line   int @[required]
	column int @[required]
}

// PosParams is the parameters to create a new `Pos`.
@[params]
pub struct PosParams {
	offset int @[required]
	line   int @[required]
	column int @[required]
}

// new_pos creates a new `Pos` in `Source`.
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

// in_range returns true if `Pos` is in `Range`.
pub fn (p Pos) in_range(r Range) bool {
	return r.begin <= p && p < r.end
}
