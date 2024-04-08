// SPDX-License-Identifier: MPL-2.0
//
// Copyright 2021-2024 zakuro <z@kuro.red> (https://x.com/zakuro9715)
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
module utils

@[noreturn]
pub fn unreachable() {
	panic('unreachable')
}

pub fn unwrap_none[T](v ?T) T {
	return v or { panic('unexpected none') }
}
