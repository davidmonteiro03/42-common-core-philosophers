/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   clear.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dcaetano <dcaetano@student.42porto.com>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/04 08:52:07 by dcaetano          #+#    #+#             */
/*   Updated: 2025/02/14 18:14:39 by dcaetano         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/philo.h"

void	ph_clear_data(t_data *data)
{
	if (!data)
		return ;
	pthread_mutex_destroy(&data->check);
	pthread_mutex_destroy(&data->display);
	free(data);
}

int	ph_clear_all(t_philo *philo, int i)
{
	if (!philo)
		return (1);
	while (++i < philo->data->num_philos)
	{
		pthread_mutex_destroy(philo[i].right_fork);
		free(philo[i].right_fork);
	}
	return (ph_clear_data(philo->data), free(philo), 0);
}
