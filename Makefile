default: serve

h help:
	@egrep '^\S|^$$' Makefile

install:
	bundle install

s serve:
	bundle exec jekyll serve --trace --livereload

build:
	echo "Starting build"
	echo "Updating bundler"
	bundle update
	echo "Building with Jekyll"
	JEKYLL_ENV=production bundle exec jekyll build --trace
	echo "Install NPM deps"
	npm install
	echo "Running staticrypt"
	npx staticrypt _site/* --short -r -d  _site
	echo "Done"
