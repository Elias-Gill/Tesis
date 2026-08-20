.PHONY: all watch build format clean

all: clean build

build:
	tectonic -X build --keep-logs --keep-intermediates

watch:
	tectonic -X watch

clean: 
	rm -rf build/

format: 
	find src -name "*.tex" -type f -exec tex-fmt {} +

check:
	fd .tex -0 | xargs -0 detex -n -l | aspell --mode=tex --lang=es --encoding=utf-8 list | sort -u | sed 's/.*/\\b&\\b/' | fd .tex -X rg --vimgrep --file=-
