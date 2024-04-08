// SPDX-License-Identifier: MPL-2.0
//
// Copyright 2021-2024 zakuro <z@kuro.red> (https://x.com/zakuro9715)
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
module builder

import kaico.source as _ { Source }

pub struct Builder {
pub:
	source &Source
}

pub fn Builder.new(source &Source) Builder {
	return Builder{
		source: source
	}
}

pub fn (b Builder) build() !string {
	return b.source.code
}
