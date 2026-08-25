.PHONY: all watch build format clean check

all: build

# ====================
# Preamble
# ====================

Tesis.pdf:
	@[ -f Tesis.pdf ] || ln -s build/Tesis/Tesis.pdf ./Tesis.pdf

.compile:
	tectonic -X build --keep-logs --keep-intermediates

# ====================
# Compilation targets
# ====================

build: .compile Tesis.pdf

watch: Tesis.pdf
	tectonic -X watch

clean:
	rm -rf Tesis.pdf build/

# ====================
# QoL targets
# ====================

format:
	find src -name "*.tex" -type f -exec tex-fmt {} +

check:
	fd .tex -0 | xargs -0 detex -n -l | aspell --mode=tex --lang=es --encoding=utf-8 list | sort -u | sed 's/.*/\\b&\\b/' | fd .tex -X rg --vimgrep --file=-
