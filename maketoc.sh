#!/usr/bin/env bash
# Generate a table of contents Markdown file
# The posts are passed in as the arguments ($@), as HTML files

POSTS=$@

# Output the table header
echo "# Table of Contents"
echo "| Date | Post | Author |"
echo "|:-|:----:|--:|"

# Create a temporary output file
TEMP=$(mktemp)
rm -f $TEMP
for post in $POSTS; do
  html=$post # the file name, e.g. post.html
  # Find the Markdown file corresponding to the HTML file (e.g., post.md)
  md=$(echo $html | sed "s/.html/.md/")
  # Extract the title from the file
  title=$(grep "^title: " $md | sed "s/title: //")
  # Extract the author from the file
  author=$(grep "^author: " $md | sed "s/author: //")
  # Extract the publication date from the file
  date=$(grep "^date: " $md | sed "s/date: //")
  # Output a row for this post to the temporary file
  echo "| $date | [$title]($html) | $author |" >> $TEMP
done

# Sort the temporary file's lines (by the date) and output it
sort -rn $TEMP
rm $TEMP
