# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dcaetano <dcaetano@student.42porto.com>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/24 07:31:26 by dcaetano          #+#    #+#              #
#    Updated: 2025/02/14 18:17:34 by dcaetano         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC           = cc
CFLAGS       = -Wall -Wextra -Werror -g #-fsanitize=thread
THREADFLAGS  = -pthread
RM           = rm -rf

OBJS_DIR     = obj/
INCLUDES_DIR = include/

SRCS         = main.c src/check.c src/clear.c src/display.c \
               src/end_of_simulation.c src/execute.c src/init.c src/time.c

OBJS         = $(addprefix $(OBJS_DIR), $(SRCS:.c=.o))

EXEC         = philo

all: $(EXEC)

$(OBJS_DIR)%.o: ./%.c
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -I$(INCLUDES_DIR) $(THREADFLAGS) -c $< -o $@

$(OBJS_DIR)%.o: srcs/%.c
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) -I$(INCLUDES_DIR) $(THREADFLAGS) -c $< -o $@

$(EXEC): $(OBJS)
	@$(CC) $(CFLAGS) -I$(INCLUDES_DIR) $(THREADFLAGS) $^ -o $@

clean:
	@$(RM) $(OBJS_DIR)

fclean: clean
	@$(RM) $(EXEC)

re: fclean all

.PHONY: all clean fclean re
