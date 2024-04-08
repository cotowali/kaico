// SPDX-License-Identifier: MPL-2.0
//
// Copyright 2021-2024 zakuro <z@kuro.red> (https://x.com/zakuro9715)
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
module source

import os
import kaico.text { Chars }

// SourceKind represents the kind of source of `Source`.
pub enum SourceKind {
	text
	local_file
}

// Source represents a source code.
@[heap]
pub struct Source {
pub:
	kind SourceKind
	path string
	code Chars
}

// Source.from_text creates `Source` from `code`
pub fn Source.from_text(code string) Source {
	return Source{
		kind: .text
		path: ''
		code: code
	}
}

// Source.read_file creates `Source` from reading content of file given by `path`
pub fn Source.read_file(path string) !Source {
	return Source{
		kind: .local_file
		path: path
		code: os.read_file(path)!
	}
}
