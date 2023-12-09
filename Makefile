# Directories
SOURCE_DIR = src
SRC_BONUS_DIR = src_bonus

# Files
SOURCEFILES = $(wildcard $(SOURCE_DIR)/*.c)
OBJECTS = $(patsubst $(SOURCE_DIR)/%.c,obj/%.o,$(SOURCEFILES))

SRC_BONUS = $(wildcard $(SRC_BONUS_DIR)/*.c)
OBJ_BONUS = $(patsubst $(SRC_BONUS_DIR)/%.c,obj/%.o,$(SRC_BONUS))

# Name of the executable
NAME = libft.a

# Compiler and flags
COMPILER = cc
FLAGS = -Wall -Wextra -Werror

# Commands
AR = ar
RM = rm -rf 

# Phony targets
.PHONY: all bonus clean fclean re

# Rules
all: $(NAME)

$(NAME): $(OBJECTS)
	@if [ ! -e $(NAME) ] || [ "$(OBJECTS)" -nt "$(NAME)" ]; then \
		$(AR) rcs $(NAME) $(OBJECTS); \
		echo "libft compiled"; \
	else \
		echo "libft is up to date"; \
	fi

bonus: $(OBJ_BONUS)
	@if [ ! -e $(NAME) ] || [ "$(OBJ_BONUS)" -nt "$(NAME)" ]; then \
		$(AR) rcs $(NAME) $(OBJ_BONUS); \
		echo "bonus files added to libft"; \
	else \
		echo "bonus files are up to date"; \
	fi

obj/%.o: $(SOURCE_DIR)/%.c | obj
	@$(COMPILER) $(FLAGS) -c $< -o $@

obj/%.o: $(SRC_BONUS_DIR)/%.c | obj
	@$(COMPILER) $(FLAGS) -c $< -o $@

obj:
	@mkdir -p obj

clean:
	@$(RM) $(OBJECTS) $(OBJ_BONUS) obj
	@echo "libft object files and obj directory removed"

fclean: clean
	@$(RM) $(NAME)
	@echo "libft removed"

re: fclean all
