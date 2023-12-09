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
RM = rm -f

# Phony targets
.PHONY: all bonus clean fclean re

# Rules
all: $(NAME)

$(NAME): $(OBJECTS)
	@$(AR) rcs $(NAME) $(OBJECTS)
	@echo "libft compiled"

bonus: $(OBJ_BONUS)
	

obj/%.o: $(SOURCE_DIR)/%.c | obj
	@$(COMPILER) $(FLAGS) -c $< -o $@

obj/%.o: $(SRC_BONUS_DIR)/%.c | obj
	@$(COMPILER) $(FLAGS) -c $< -o $@
	@$(AR) rcs $(NAME) $(OBJ_BONUS)

obj:
	@mkdir -p obj

clean:
	@$(RM) $(OBJECTS) $(OBJ_BONUS)
	@echo "libft object files removed"

fclean: clean
	@$(RM) $(NAME)
	@echo "libft removed"

re: fclean all
