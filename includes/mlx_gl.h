/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   mlx_gl.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenini- <your@mail.com>                   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/09/24 00:00:00 by fbenini-          #+#    #+#             */
/*   Updated: 2026/09/24 00:00:00 by fbenini-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef MLX_GL_H
# define MLX_GL_H

#ifdef __EMSCRIPTEN__
# ifndef GLFW_INCLUDE_NONE
#  define GLFW_INCLUDE_NONE
# endif
# include <GLES3/gl3.h>
#else
# include "../glad/include/glad/glad.h"
#endif

#endif
