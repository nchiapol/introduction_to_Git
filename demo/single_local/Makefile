
NAME = $(shell basename $(shell pwd))

all: demo ex
	

demo:
	grep -E '^ *$$' -v $(NAME).txt > demo_$(NAME).txt

ex:
	grep -E '^#.*$$|^ *$$' $(NAME).txt > exercise_$(NAME).txt

clean:
	rm demo_$(NAME).txt exercise_$(NAME).txt

upload:
	scp exercise_$(NAME).txt python@linux:~/public_html/python/lecture1/

