
slides = git-tutorial
lecture = 1

all:
	pdflatex --shell-escape $(slides).tex
	pdflatex --shell-escape $(slides).tex


upload:
	scp $(slides).pdf python@linux.physik.uzh.ch:~/public_html/python/lecture$(lecture)/

