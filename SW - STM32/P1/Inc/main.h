/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32g4xx_hal.h"
#include "stm32g4xx_ll_pwr.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define C_Pin GPIO_PIN_0
#define C_GPIO_Port GPIOF
#define E_Pin GPIO_PIN_1
#define E_GPIO_Port GPIOF
#define Thermistor2_Pin GPIO_PIN_0
#define Thermistor2_GPIO_Port GPIOA
#define SW_UP_Pin GPIO_PIN_2
#define SW_UP_GPIO_Port GPIOA
#define SW_DOWN_Pin GPIO_PIN_7
#define SW_DOWN_GPIO_Port GPIOA
#define FAN_PWM_Pin GPIO_PIN_0
#define FAN_PWM_GPIO_Port GPIOB
#define D_Pin GPIO_PIN_8
#define D_GPIO_Port GPIOA
#define DIG1_CA_Pin GPIO_PIN_9
#define DIG1_CA_GPIO_Port GPIOA
#define DIG2_CA_Pin GPIO_PIN_10
#define DIG2_CA_GPIO_Port GPIOA
#define B_Pin GPIO_PIN_11
#define B_GPIO_Port GPIOA
#define T_SWDIO_Pin GPIO_PIN_13
#define T_SWDIO_GPIO_Port GPIOA
#define T_SWCLK_Pin GPIO_PIN_14
#define T_SWCLK_GPIO_Port GPIOA
#define G_Pin GPIO_PIN_3
#define G_GPIO_Port GPIOB
#define A_Pin GPIO_PIN_4
#define A_GPIO_Port GPIOB
#define F_Pin GPIO_PIN_5
#define F_GPIO_Port GPIOB
#define Heater_EN_Pin GPIO_PIN_6
#define Heater_EN_GPIO_Port GPIOB
#define LD2_Pin GPIO_PIN_8
#define LD2_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

typedef enum {
	off,
	on,
} main_states;

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
