.PHONY: all
all: clean result

result:
	./scripts/build.sh

.PHONY: clean
clean:
	rm -f result

.PHONY: run
run:
	./scripts/run.sh

.PHONY: full
full:
	./scripts/build.sh
	./scripts/run.sh

.PHONY: wbuild
wbuild:
	watchman-make -p 'lua/**/*.lua' 'nix/**/*.nix' -t all

.PHONY: wrun
wrun:
	watchman-make -p 'result' -t run
