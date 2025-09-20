all: latexsheet.pdf latexsheet-a4.pdf latexsheet-0.png latexsheet-thumb-0.png

clean:
	rm -f latexsheet.pdf latexsheet-a4.tex latexsheet-a4.pdf \
	      latexsheet-0.png latexsheet-1.png \
	      latexsheet-thumb-0.png latexsheet-thumb-1.png \
	      latexsheet.out latexsheet-a4.out


latexsheet.pdf: latexsheet.tex
	pdflatex latexsheet.tex
	rm -f latexsheet.aux latexsheet.log latexsheet.out

# OK, this is kind of a hack to add 'a4paper' to the header
latexsheet-a4.tex: latexsheet.tex
	cat latexsheet.tex | sed -e 's/\\usepackage\[landscape\]/\\usepackage\[a4paper,landscape\]/' > latexsheet-a4.tex

latexsheet-a4.pdf: latexsheet-a4.tex
	pdflatex latexsheet-a4.tex
	rm -f latexsheet-a4.tex latexsheet-a4.aux latexsheet-a4.log latexsheet-a4.out

latexsheet-0.png: latexsheet.pdf
	gs -dNOPAUSE -dBATCH -sDEVICE=png16m -r150 -sOutputFile="latexsheet-%d.png" "latexsheet.pdf"

latexsheet-thumb-0.png: latexsheet.pdf
	gs -dNOPAUSE -dBATCH -sDEVICE=png16m -r32 -sOutputFile="latexsheet-thumb-%d.png" "latexsheet.pdf"
