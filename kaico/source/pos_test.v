// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.source { Pos }

fn test_op() {
	p1 := Pos{none, 1, 1, 1}
	p2 := Pos{none, 2, 1, 1}
	assert p1 < p2
	assert !(p2 < p2)

	assert p1 <= p1
	assert p1 <= p2
	assert !(p2 <= p1)

	assert p2 > p1
	assert !(p1 > p2)

	assert p2 >= p2
	assert p2 >= p1
	assert !(p1 >= p2)

	assert p1 == p1
	assert !(p1 == p2)
	assert p1 != p2
	assert !(p1 != p1)
}
