BIN=./node_modules/.bin/
OUT=./dist

run: build
	$(BIN)ws

build: dist browserify jade stylus

browserify: node_modules
	$(BIN)browserify src/index.js -o $(OUT)/app.js

jade:
	$(BIN)jade < src/index.jade > $(OUT)/index.html

stylus:
	$(BIN)stylus < src/index.styl > $(OUT)/app.css

node_modules:
	npm i

dist:
	mkdir -p dist

clean:
	rm -rf node_modules dist

.PHONY: clean
