// Copyright (c) 2021-2023 The Kaico Authors.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
import kaico.chars { Char, Chars }

fn test_chars() {
	cc := Chars.new('abcあいう')
	assert cc.at(0) == Char.new('a')
	assert cc.at(1) == Char.new('b')
	assert cc.at(2) == Char.new('c')
	assert cc.at(3) == Char.new('あ')
	assert cc.at(6) == Char.new('い')
	assert cc.at(9) == Char.new('う')
}

fn check(@fn string, line string, list []Char, f fn (c Char) bool) {
	for c in list {
		assert f(c), 'check `${c}` failed in ${@fn}() at line ${line}'
	}
}

fn test_is_ascii() {
	true_list := ['a', 'A', 'z', 'Z', '0', '9']
	false_list := ['あ', 'ａ', 'Ａ', '０', '９', 'Á']
	check(@FN, @LINE, true_list, |c| c.is_ascii())
	check(@FN, @LINE, false_list, |c| !c.is_ascii())
}

fn test_is_digit() {
	true_list := ['0', '9']
	false_list := ['a', 'z', 'A', 'Z', 'あ', 'ａ', 'Ａ', '０', '９', 'Á']
	check(@FN, @LINE, true_list, |c| c.is_digit())
	check(@FN, @LINE, false_list, |c| !c.is_digit())
}

fn test_is_lower_alphabet() {
	true_list := ['a', 'z']
	false_list := ['0', '9', 'A', 'Z', 'あ', 'ａ', 'Ａ', '０', '９', 'Á']
	check(@FN, @LINE, true_list, |c| c.is_lower_alphabet())
	check(@FN, @LINE, false_list, |c| !c.is_lower_alphabet())
}

fn test_is_upper_alphabet() {
	true_list := ['A', 'Z']
	false_list := ['0', '9', 'a', 'z', 'あ', 'ａ', 'Ａ', '０', '９', 'Á']
	check(@FN, @LINE, true_list, |c| c.is_upper_alphabet())
	check(@FN, @LINE, false_list, |c| !c.is_upper_alphabet())
}

fn test_is_alphabet() {
	true_list := ['a', 'A', 'z', 'Z']
	false_list := ['0', '9', 'あ', 'ａ', 'Ａ', '０', '９', 'Á']
	check(@FN, @LINE, true_list, |c| c.is_alphabet())
	check(@FN, @LINE, false_list, |c| !c.is_alphabet())
}

fn test_is_ident() {
	true_list := ['a', 'A', 'z', 'Z', '0', '9', '_']
	false_list := ['&', 'あ', 'ａ', 'Ａ', '０', '９', 'Á']
	check(@FN, @LINE, true_list, |c| c.is_ident())
	check(@FN, @LINE, false_list, |c| !c.is_ident())
}

fn test_is_ident_first() {
	true_list := ['a', 'A', 'z', 'Z', '_']
	false_list := ['0', '9', '&', 'あ', 'ａ', 'Ａ', '０', '９', 'Á']
	check(@FN, @LINE, true_list, |c| c.is_ident_first())
	check(@FN, @LINE, false_list, |c| !c.is_ident_first())
}

fn test_is_whitespace() {
	false_list := [
		'0',
		'9',
		'&',
		'_',
		'a',
		'A',
		'あ',
		'ａ',
		'Ａ',
		'０',
		'９',
		'Á',
	]
	check(@FN, @LINE, chars.whitespaces, |c| c.is_whitespace())
	check(@FN, @LINE, false_list, |c| !c.is_whitespace())
}
