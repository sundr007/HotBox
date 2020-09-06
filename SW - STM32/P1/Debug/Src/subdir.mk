################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/SEVEN_SEGMENTS.c \
../Src/SEVEN_SEGMENTS_cfg.c \
../Src/app_freertos.c \
../Src/main.c \
../Src/stm32g4xx_hal_msp.c \
../Src/stm32g4xx_hal_timebase_tim.c \
../Src/stm32g4xx_it.c \
../Src/syscalls.c \
../Src/system_stm32g4xx.c 

OBJS += \
./Src/SEVEN_SEGMENTS.o \
./Src/SEVEN_SEGMENTS_cfg.o \
./Src/app_freertos.o \
./Src/main.o \
./Src/stm32g4xx_hal_msp.o \
./Src/stm32g4xx_hal_timebase_tim.o \
./Src/stm32g4xx_it.o \
./Src/syscalls.o \
./Src/system_stm32g4xx.o 

C_DEPS += \
./Src/SEVEN_SEGMENTS.d \
./Src/SEVEN_SEGMENTS_cfg.d \
./Src/app_freertos.d \
./Src/main.d \
./Src/stm32g4xx_hal_msp.d \
./Src/stm32g4xx_hal_timebase_tim.d \
./Src/stm32g4xx_it.d \
./Src/syscalls.d \
./Src/system_stm32g4xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DSTM32G431xx -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Inc" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Drivers/STM32G4xx_HAL_Driver/Inc" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Drivers/STM32G4xx_HAL_Driver/Inc/Legacy" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Drivers/CMSIS/Device/ST/STM32G4xx/Include" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Drivers/CMSIS/Include" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Middlewares/Third_Party/FreeRTOS/Source/include" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"/home/evan/Documents/github/HotBox/SW - STM32/P1/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


