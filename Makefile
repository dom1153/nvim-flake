.PHONY: all
all: clean result

result:
	./scripts/build.sh

.PHONY: clean
clean:
	rm -f result

.PHONY: run
run: clean result
	 ./scripts/run.sh
