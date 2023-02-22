# our desired posts (as HTML files)
POSTS = posts/grep.html posts/sed.html posts/make.html posts/pandoc.html posts/imagemagick.html

# our desired images (as JPEG images)
COMICS=xkcd/dependency.jpg xkcd/modern_tools.jpg xkcd/regular_expressions.jpg xkcd/file_extensions.jpg xkcd/perl_problems.jpg

# The default rule builds the index (the homepage) and all the images
all: index.html $(COMICS)

# TODO: Generate HTML files from one or more MD files
# Make sure the HTML files are "standalone"
index.html: index.md toc.md
%.html: %.md
	@echo "I don't know how to build <$@> from <$^>!" && false # delete this line when you're done

# TODO: Generate JPG files from PNG files
# Make sure the generated images are at 50% quality!
xkcd/%.jpg: xkcd/%.png
	@echo "I don't know how to build <$@> from <$<>" && false # delete this line when you're done

# We use an external script to generate a table of contents
toc.md: maketoc.sh $(POSTS)
	sh maketoc.sh $(POSTS) > $@

# The "clean" rule deletes all output files built by our Makefile, if they exist.
clean:
	rm -f index.html $(POSTS) $(COMICS) toc.md

# This target will try to open the blog in your browser, but may not work on
# all computers.
open: all
	python3 -m webbrowser index.html

# This target will try to start a web server displaying your blog, which you
# can access from your browser.
serve: all
	@echo "Open http://localhost:8000 to see your blog."
	@echo "Press control-C to stop the server."
	python3 -m http.server

# These rules are "phony" since they don't create actual files.
.PHONY: all clean open serve
