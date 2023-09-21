kaico := kaico

path_cmd := cmd
path_dist := dist
kaico_src = $(path_cmd)/cmd_$(kaico)
kaico_bin = $(path_dist)/$(kaico)

# binaries
v_files=$(wildcard **/*.v)

$(path_dist): $(path_dist)/.keep
	@:
$(path_dist)/.keep:
	@mkdir -p $(path_dist)
	@touch $(path_dist)/.keep

$(kaico_bin): $(v_files) $(path_dist)
	v -o $(kaico_bin) $(kaico_src)

# tasks

.DEFAULT_GOAL := all
.PHONY: build run clean all
build: $(kaico_bin)
	@:
run: build
	@$(kaico_bin)
clean:
	rm -r $(path_dist)
all: build
	@:
