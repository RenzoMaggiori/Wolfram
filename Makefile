##
## EPITECH PROJECT, 2023
## wolfram
## File description:
## Makefile
##

NAME = wolfram

all: build copy

build:
	stack build

copy:
	cp `stack path --local-install-root`/bin/wolfram-exe ./$(NAME)

clean:
	stack clean

fclean: clean
	rm -f $(NAME)

re: fclean all

