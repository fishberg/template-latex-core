$pdf_mode = 1;                      # build a PDF with pdflatex

# Switches for every TeX engine (pdflatex/xelatex/lualatex):
#   -synctex=1          SyncTeX data for editor <-> PDF navigation (VS Code)
#   -interaction=...    don't stop on errors
#   -file-line-error    "file:line: message" errors (greppable, IDE-friendly)
set_tex_cmds('-synctex=1 -interaction=nonstopmode -file-line-error %O %S');

$bibtex_use    = 2;                 # run biber/bibtex and clean its by-products
@default_files = ('main.tex');

# extra by-products to remove on `latexmk -c` / `-C`
# ($bibtex_use = 2 auto-selects biber vs bibtex from the .bcf / \bibdata)
$clean_ext = 'bbl bcf run.xml -blx.bib synctex.gz nav snm vrb loa lox thm';

# Everything generated -- aux files (*.aux, *.log, ...), main.pdf, and
# main.synctex.gz -- goes to build/. Nothing but sources stays in the project
# root. VS Code matches this via .vscode/settings.json (outDir -> %DIR%/build).
# To keep main.pdf in the project root instead, set only `$aux_dir = 'build';`.
$aux_dir = 'build';
$out_dir = 'build';
