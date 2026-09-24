# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenini- <your@mail.com>                   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/05 06:33:27 by fbenini-          #+#    #+#              #
#    Updated: 2025/10/05 07:12:55 by fbenini-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = program

CC = cc

CFLAGS = -Wall -Wextra -Werror -O3

SRCS = ./main.c

OBJS = $(SRCS:.c=.o)

LIBMLX = ../libmlx.a

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(NAME) -L.. -lmlx -lGL -lglfw

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAME)

re: fclean $(NAME)

.PHONY: all re fclean clean web webclean

# --- WebGL / Emscripten build ---

WEB_NAME = program.html

WEB_CC = emcc

WEB_CFLAGS = -Wall -Wextra -Werror -O3

WEB_LDFLAGS = -sUSE_GLFW=3 -sMIN_WEBGL_VERSION=2 -sMAX_WEBGL_VERSION=2 \
	-sALLOW_MEMORY_GROWTH=1

WEB_LIBMLX = ../libmlx_web.a

web: $(WEB_NAME)

$(WEB_NAME): $(SRCS) $(WEB_LIBMLX)
	$(WEB_CC) $(WEB_CFLAGS) $(WEB_LDFLAGS) $(SRCS) -o $(WEB_NAME) -L.. -lmlx_web

webclean:
	rm -rf program.html program.js program.wasm
