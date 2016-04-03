rebuild: clean compile

clean:
	@rm -rf *~ *.o target

compile: target.s
	as target.s -o target.o
	ld target.o -o target

test: rebuild
	./target
