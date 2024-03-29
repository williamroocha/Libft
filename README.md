# Libft

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/mit/)
[![Build Status](https://img.shields.io/badge/status-complete-brightgreen.svg)](https://travis-ci.com/williamroocha/ft_printf)
[![Build Status](https://img.shields.io/badge/42-2023-blue.svg)](https://42lisboa.com/)

## Introduction
This project is my first attempt at recreating the C standard library. It is a collection of functions that I will be allowed to reuse in most of my C projects across the 42-curriculum.

## Table of Contents
- [Introduction](#introduction)
- [Table of Contents](#table-of-contents)
- [Description](#description)
- [Usage](#usage)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Description
The project consists of the following functions:

### Functions from `<ctype.h>`
- [`ft_isalpha`](ft_isalpha.c)				- checks  for  an  alphabetic  character.
- [`ft_isdigit`](ft_isdigit.c)				- checks for a digit (0 through 9).
- [`ft_isalnum`](ft_isalnum.c)				- checks for an alphanumeric character.
- [`ft_isascii`](ft_isascii.c)				- checks whether c fits into the ASCII character set.
- [`ft_isprint`](ft_isprint.c)				- checks for any printable character.
- [`ft_toupper`](ft_toupper.c)				- convert char to uppercase.
- [`ft_tolower`](ft_tolower.c)				- convert char to lowercase.

### Functions from `<string.h>`
- [`ft_memset`](ft_memset.c)				- fill memory with a constant byte.
- [`ft_strlen`](ft_strlen.c)				- calculate the length of a string.
- [`ft_bzero`](ft_bzero.c)					- zero a byte string.
- [`ft_memcpy`](ft_memcpy.c)				- copy memory area.
- [`ft_memmove`](ft_memmove.c)				- copy memory area.
- [`ft_strlcpy`](ft_strlcpy.c)				- copy string to an specific size.
- [`ft_strlcat`](ft_strlcat.c)				- concatenate string to an specific size.
- [`ft_strchr`](ft_strchr.c)				- locate character in string.
- [`ft_strrchr`](ft_strrchr.c)				- locate character in string.
- [`ft_strncmp`](ft_strncmp.c)				- compare two strings.
- [`ft_memchr`](ft_memchr.c)				- scan memory for a character.
- [`ft_memcmp`](ft_memcmp.c)				- compare memory areas.
- [`ft_strnstr`](ft_strnstr.c)				- locate a substring in a string.
- [`ft_strdup`](ft_strdup.c)				- creates a dupplicate for the string passed as parameter.

### Functions from `<stdlib.h>`
- [`ft_atoi`](ft_atoi.c)					- convert a string to an integer.
- [`ft_atoll`](ft_atoll.c)					- convert a string to a long long integer.
- [`ft_calloc`](ft_calloc.c)				- allocates memory and sets its bytes' values to 0.

### Non-standard functions
- [`ft_substr`](ft_substr.c)				- returns a substring from a string.
- [`ft_strjoin`](ft_strjoin.c)				- concatenates two strings.
- [`ft_strtrim`](ft_strtrim.c)				- trims the beginning and end of string with specific set of chars.
- [`ft_split`](ft_split.c)					- splits a string using a char as parameter.
- [`ft_itoa`](ft_itoa.c)					- converts a number into a string.
- [`ft_strmapi`](ft_strmapi.c)				- applies a function to each character of a string.
- [`ft_striteri`](ft_striteri.c)			- applies a function to each character of a string.
- [`ft_putchar_fd`](ft_putchar_fd.c)		- output a char to a file descriptor.
- [`ft_putstr_fd`](ft_putstr_fd.c)			- output a string to a file descriptor.
- [`ft_putendl_fd`](ft_putendl_fd.c)		- output a string to a file descriptor, followed by a new line.
- [`ft_putnbr_fd`](ft_putnbr_fd.c)			- output a number to a file descriptor.

### Linked list functions

- [`ft_lstnew`](ft_lstnew.c)				- creates a new list element.
- [`ft_lstadd_front`](ft_lstadd_front.c)	- adds an element at the beginning of a list.
- [`ft_lstsize`](ft_lstsize.c)				- counts the number of elements in a list.
- [`ft_lstlast`](ft_lstlast.c)				- returns the last element of the list.
- [`ft_lstadd_back`](ft_lstadd_back.c)		- adds an element at the end of a list.
- [`ft_lstclear`](ft_lstclear.c)			- deletes and free list.
- [`ft_lstiter`](ft_lstiter.c)				- applies a function to each element of a list.
- [`ft_lstmap`](ft_lstmap.c)				- applies a function to each element of a list.

## Usage
To use the library, clone the repository and compile the files with your program:
```bash
git clone git@github.com:williamroocha/Libft.git
```
Then, include the header file in your program:
```c
#include "path_to_libft/include/libft.h"
```
Finally, compile your program with the library:
```bash
cc -I path_to_libft/include -L path_to_libft -lft your_program.c
```

## Examples

### Example 1: Using String Manipulation Functions
```c
#include "path_to_libft/include/libft.h"

int	main(void)
{
	char source[] = "Hello, ";
	char destination[20];

	ft_strcpy(destination, source);
	ft_strcat(destination, "world!");
	ft_putstr(destination);
	return (0);
}
```

### Example 2: Using Linked List Functions
```c
#include "path_to_libft/include/libft.h"

void	print_element(void *content)
{
	ft_putstr((char *)content);
	ft_putchar('\n');
}

void	free_element(void *content)
{
	free(content);
}

int	main(void)
{
	t_list	*list;

	list = NULL;
	ft_lstadd_back(&list, ft_lstnew("Hello"));
	ft_lstadd_back(&list, ft_lstnew("world!"));
	ft_lstiter(list, &print_element);
	ft_lstclear(&list, &free_element);
	return (0);
}
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the terms of the [MIT license](https://opensource.org/license/mit/)