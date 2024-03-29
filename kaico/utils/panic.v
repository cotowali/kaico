// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
module utils

@[noreturn]
pub fn unreachable() {
	panic('unreachable')
}

pub fn unwrap_none[T](v ?T) T {
	return v or { panic('unexpected none') }
}
