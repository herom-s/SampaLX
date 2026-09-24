# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbenini- <your@mail.com>                   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/11 18:28:31 by fbenini-          #+#    #+#              #
#    Updated: 2025/10/14 20:17:35 by fbenini-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = "libmlx.a"

CC = cc

AR = ar rcs

CFLAGS = -Wall -Wextra -Werror -O3

ENDFLAGS = -lglfw -lGL

GLAD = ./glad/libglad.a

GLADSRCS = ./glad/src/glad.c

GLADOBJS = $(GLADSRCS:.c=.o)

SRCS = $(wildcard ./src/*.c)

OBJS = $(SRCS:.c=.o)

$(NAME): $(OBJS) $(GLAD)
	mv $(GLAD) $(NAME)
	$(AR) $(NAME) $(OBJS) $(GLADOBJS)

$(GLAD): $(GLADOBJS)
	$(AR) $(GLAD) $(GLADOBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

clean:
	rm -rf $(OBJS) $(GLADOBJS)

fclean: clean
	rm -rf $(NAME)

re: fclean $(NAME)

.PHONY: re clean fclean all web webclean

# --- WebGL / Emscripten build ---

WEB_NAME = libmlx_web.a

WEB_CC = emcc

WEB_AR = emar

WEB_CFLAGS = -Wall -Wextra -Werror -O3

WEB_SRCS = $(SRCS)

WEB_OBJS = $(WEB_SRCS:.c=.web.o)

web: $(WEB_NAME)

$(WEB_NAME): $(WEB_OBJS)
	$(WEB_AR) rcs $(WEB_NAME) $(WEB_OBJS)

%.web.o: %.c
	$(WEB_CC) $(WEB_CFLAGS) -c $< -o $@

webclean:
	rm -rf $(WEB_OBJS) $(WEB_NAME)
