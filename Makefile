# Copy src/ directory structure to out/
$(shell find src/ -type d | sed 's/^src/out/g' | xargs mkdir -p)

all: $(patsubst src/%.tex,out/%.pdf,$(shell find src/ -regex '.*.tex'))

out/%.pdf: src/%.tex; pdflatex -file-line-error -halt-on-error -output-directory $(dir $@) $<

clean:; rm -rf out/

tidy:; find out/ -regex '.*.\(aux\|log\|out\)' -delete
