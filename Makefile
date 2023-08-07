# Directoies 
SOURCE_DIR = src

# Files
SOURCEFILES = $(addprefix $(SOURCE_DIR)/, \
    ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c \
    ft_isprint.c ft_strlen.c ft_memset.c ft_bzero.c	\
    ft_memcpy.c ft_memmove.c ft_strlcpy.c ft_strlcat.c \
    ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c \
    ft_strncmp.c ft_memchr.c ft_memcmp.c ft_strnstr.c \
    ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c \
    ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c \
    ft_strmapi.c ft_striteri.c ft_putchar_fd.c \
    ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
    ft_atoll.c \
)
OBJECTS = $(patsubst $(SOURCE_DIR)/%.c,obj/%.o,$(SOURCEFILES))

SRC_BONUS_DIR = src_bonus
SRC_BONUS = $(addprefix $(SRC_BONUS_DIR)/, \
    ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c ft_lstadd_back.c ft_lstdelone.c \
    ft_lstclear.c ft_lstiter.c ft_lstmap.c \
)
OBJ_BONUS = $(patsubst $(SRC_BONUS_DIR)/%.c,obj/%.o,$(SRC_BONUS))

# Name of the executable
NAME = libft.a

# Compiler and flags
COMPILER = cc
FLAGS = -Wall -Wextra -Werror

# Commands
AR = ar
RM = rm -f

# Phony targets
.PHONY: all bonus clean fclean re

# Rules
all: $(NAME)

$(NAME): $(OBJECTS)
	@$(AR) rcs $(NAME) $(OBJECTS)
	@echo "libft compiled"

bonus: $(OBJ_BONUS)
	@$(AR) rcs $(NAME) $(OBJ_BONUS)

obj/%.o: $(SOURCE_DIR)/%.c | obj
	@$(COMPILER) $(FLAGS) -c $< -o $@

obj/%.o: $(SRC_BONUS_DIR)/%.c | obj
	@$(COMPILER) $(FLAGS) -c $< -o $@

obj:
	@mkdir -p obj

clean:
	@$(RM) $(OBJECTS) $(OBJ_BONUS)
	@echo "libft object files removed"

fclean: clean
	@$(RM) $(NAME)
	@echo "libft removed"

re: fclean all
