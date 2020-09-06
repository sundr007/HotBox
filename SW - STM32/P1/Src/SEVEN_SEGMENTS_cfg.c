#include "SEVEN_SEGMENTS.h"
#include "main.h"
const SEVEN_SEG_CfgType SEVEN_SEG_CfgParam[SEVEN_SEG_UNITS] =
{
    // 7-Segments Display Unit 1 Configurations
    {
    	/* Seven Segments Pins Info */
    //{G_GPIO_Port,F_GPIO_Port,E_GPIO_Port,D_GPIO_Port,C_GPIO_Port,B_GPIO_Port,A_GPIO_Port},
	//{G_Pin,F_Pin,E_Pin,D_Pin,C_Pin,B_Pin,A_Pin},
    {A_GPIO_Port,B_GPIO_Port,C_GPIO_Port,D_GPIO_Port,E_GPIO_Port,F_GPIO_Port,G_GPIO_Port},
	{A_Pin,B_Pin,C_Pin,D_Pin,E_Pin,F_Pin,G_Pin},

        /* Enable Control Signal's Pins */
	{DIG2_CA_GPIO_Port, DIG1_CA_GPIO_Port},
	{DIG2_CA_Pin, DIG1_CA_Pin}
    }
};
