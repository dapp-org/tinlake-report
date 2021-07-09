SRC=report.org
OUT=out

all: $(OUT)/report.html

$(OUT)/report.html: $(SRC)
	mkdir -p $(OUT)
	cp -r resources $(OUT)
	nix-shell --pure --command 'orgdapp-doc $(SRC) $@'
