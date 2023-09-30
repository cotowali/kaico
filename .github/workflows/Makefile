.PHONY: setup setup-v

vroot := /opt/v

setup: setup-v

setup-v:
	git clone https://github.com/vlang/v $(vroot) --depth 1
	cd $(vroot) && make
	$(vroot)/v symlink
