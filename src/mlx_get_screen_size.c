/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   mlx_get_screen_size.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: fbenini- <your@mail.com>                   +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/15 17:49:20 by fbenini-          #+#    #+#             */
/*   Updated: 2025/10/15 17:49:25 by fbenini-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/mlx_int.h"

int	mlx_get_screen_size(void *mlx_ptr, int *sizex, int *sizey)
{
	int	width;
	int	height;

	if (!mlx_ptr)
		return (1);
#ifdef __EMSCRIPTEN__
	emscripten_get_screen_size(&width, &height);
#else
	{
		const GLFWvidmode *const	vidmode =
			glfwGetVideoMode(glfwGetPrimaryMonitor());

		if (!vidmode)
			return (1);
		width = vidmode->width;
		height = vidmode->height;
	}
#endif
	if (sizex)
		*sizex = width;
	if (sizey)
		*sizey = height;
	return (0);
}
