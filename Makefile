# ------------
# common utils
# ------------
path_cmd := cmd
path_dist := dist

v_files=$(wildcard **/*.v)

$(path_dist): $(path_dist)/.keep
	@:
$(path_dist)/.keep:
	@mkdir -p $(path_dist)
	@touch $(path_dist)/.keep

# --------
# binaries
# --------
kaico_src := $(path_cmd)/cmd_kaico
kaico_bin := $(path_dist)/kaico
$(kaico_bin): $(v_files) $(path_dist)
	v -o $(kaico_bin) $(kaico_src)

# -----
# tasks
# -----
.DEFAULT_GOAL := all
.PHONY: build run clean test all
build: $(kaico_bin)
	@:
run: build
	@$(kaico_bin)
clean:
	rm -r $(path_dist)
test:
	v test .
all: build
	@:
