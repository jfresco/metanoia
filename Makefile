BIN=./node_modules/.bin/
OUT=./dist

run: build
	$(BIN)ws

build: dist assets browserify jade stylus

browserify: node_modules
	$(BIN)browserify src/index.js -o $(OUT)/app.js

jade:
	$(BIN)jade src/index.jade --out $(OUT)

stylus:
	$(BIN)stylus < src/index.styl --include-css > $(OUT)/app.css

assets: dist
	cp src/images/* $(OUT)/assets

node_modules:
	npm i

dist:
	mkdir -p dist/assets

clean:
	rm -rf node_modules dist

.PHONY: clean
