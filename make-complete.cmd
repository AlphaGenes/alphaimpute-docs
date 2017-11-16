pandoc --standalone --smart --from=markdown+yaml_metadata_block+inline_notes --template=latex_template.tex --natbib --filter pandoc-tablenos --filter pandoc-fignos chapters/00-title-page-complete.md chapters/00-front-matter.md chapters/01-small-intro.md  chapters/10-quick-reference.md chapters/10-full-reference.md chapters/99-bibtex-appendix.md -o complete.tex

if %ERRORLEVEL% NEQ 0 (
  echo "Pandoc stopped."
   exit /b %ERRORLEVEL%
)

pdflatex complete
bibtex complete
makeindex complete
pdflatex complete
pdflatex complete

