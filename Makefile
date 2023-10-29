$(shell mkdir -p out)

all: $(patsubst src/%.tex,out/%.pdf,$(wildcard src/*))

out/%.pdf: src/%.tex; pdflatex -file-line-error -halt-on-error -output-directory out/ $<

clean:; rm -rf out/

tidy:; rm out/*.aux out/*.log
