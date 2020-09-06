################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.o: ../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32G431xx -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Inc" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Drivers/STM32G4xx_HAL_Driver/Inc" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Drivers/STM32G4xx_HAL_Driver/Inc/Legacy" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Drivers/CMSIS/Device/ST/STM32G4xx/Include" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Drivers/CMSIS/Include" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Middlewares/Third_Party/FreeRTOS/Source/include" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


