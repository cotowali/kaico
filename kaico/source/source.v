// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
module source

import os
import kaico.chars { Chars }

pub enum SourceKind {
	text
	local_file
}

[heap]
pub struct Source {
pub:
	kind SourceKind
	path string
	code Chars
}

pub fn Source.from_text(code string) Source {
	return Source{
		kind: .text
		path: ''
		code: code
	}
}

pub fn Source.read_file(path string) !Source {
	return Source{
		kind: .local_file
		path: path
		code: os.read_file(path)!
	}
}
