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
full: clean result
	 ./scripts/run.sh
