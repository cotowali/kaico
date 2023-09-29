# ------------
# common utils
# ------------
path_cmd := cmd
path_dist := dist
path_snippets := snippets

v_files := $(shell find -name '*.v')

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
.PHONY: new build run clean fmt test all

new_file_template_path := $(path_snippets)/license.vv
new: file :=
new:
	cp $(new_file_template_path) $(file)
build: $(kaico_bin)
	@:
run: args :=
run: build
	@$(kaico_bin) $(args)
clean:
	rm -r $(path_dist)
test:
	v test .
fmt: files := $(v_files)
fmt:
	@v fmt -w $(files)
all: build
	@:

# ------
# docker
# ------
docker-tag := kaico/kaico-dev
docker-tag := kaico/kaico-dev
docker-build: tag := $(docker-tag)
docker-build:
	docker build -t $(docker-tag) .
docker-run: tag := $(docker-tag)
docker-run: args := bash
docker-run:
	echo $(args)
	docker run -it $(tag) $(args)
