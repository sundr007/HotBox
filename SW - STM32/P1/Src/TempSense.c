/*
 * TempSense.c
 *
 *  Created on: Sep 7, 2020
 *      Author: evan
 */
/*
================================================================================

    File........... Thermistor_Demo_Code
    Purpose........ Thermistor demonstration code
    Author......... Joseph Corleto
    E-mail......... corleto.joseph@gmail.com
    Started........ 7/25/2016
    Finished....... 7/25/2016
    Updated........ --/--/----

================================================================================
   Notes
================================================================================

================================================================================
  Updates
================================================================================
*/

//===============================================================================
//  Header Files
//===============================================================================
#include "stdint.h"
//===============================================================================
//  Constants
//===============================================================================
//Thermistor related:

/* Here we have a few constants that make editing the code easier. I will go
   through them one by one.

   A reading from the ADC might give one value at one sample and then a little
   different the next time around. To eliminate noisy readings, we can sample
   the ADC pin a few times and then average the samples to get something more
   solid. This constant is utilized in the readThermistor function.
   */
const int    SAMPLE_NUMBER      = 10;

/* In order to use the Beta equation, we must know our other resistor
   within our resistor divider. If you are using something with large tolerance,
   like at 5% or even 1%, measure it and place your result here in ohms. */
const double BALANCE_RESISTOR   = 10000.0;

// This helps calculate the thermistor's resistance (check article for details).
const double MAX_ADC            = 4095.0;

/* This is thermistor dependent and it should be in the datasheet, or refer to the
   article for how to calculate it using the Beta equation.
   I had to do this, but I would try to get a thermistor with a known
   beta if you want to avoid empirical calculations. */
const double BETA               = 3590.0;

/* This is also needed for the conversion equation as "typical" room temperature
   is needed as an input. */
const double ROOM_TEMP          = 298.15;   // room temperature in Kelvin

/* Thermistors will have a typical resistance at room temperature so write this
   down here. Again, needed for conversion equations. */
const double RESISTOR_ROOM_TEMP = 10000.0;

//===============================================================================
//  Functions
//===============================================================================
/////////////////////////////
////// readThermistor ///////
/////////////////////////////
/*
This function reads the analog pin as shown below. Converts voltage signal
to a digital representation with analog to digital conversion. However, this is
done multiple times so that we can average it to eliminate measurement errors.
This averaged number is then used to calculate the resistance of the thermistor.
After this, the resistance is used to calculate the temperature of the
thermistor. Finally, the temperature is converted to celsius. Please refer to
the allaboutcircuits.com article for the specifics and general theory of this
process.

Quick Schematic in case you are too lazy to look at the site :P

          (Ground) ----\/\/\/-------|-------\/\/\/---- V_supply
                     R_balance      |     R_thermistor
                                    |
                               Analog Pin
*/

double readThermistor(uint32_t ADC_Value)
{
  // variables that live in this function
  double rThermistor = 0;            // Holds thermistor resistance value
  double tKelvin     = 0;            // Holds calculated temperature
  double tCelsius    = 0;            // Hold temperature in celsius
  double adcAverage  = 0;            // Holds the average voltage measurement
//  int    adcSamples[SAMPLE_NUMBER];  // Array to hold each voltage measurement

  /* Calculate thermistor's average resistance:
     As mentioned in the top of the code, we will sample the ADC pin a few times
     to get a bunch of samples. A slight delay is added to properly have the
     analogRead function sample properly */

//  for (int i = 0; i < SAMPLE_NUMBER; i++)
//  {
//    adcSamples[i] = analogRead(thermistorPin);  // read from pin and store
//    delay(10);        // wait 10 milliseconds
//  }

  /* Then, we will simply average all of those samples up for a "stiffer"
     measurement. */
//  for (int i = 0; i < SAMPLE_NUMBER; i++)
//  {
//    adcAverage += adcSamples[i];      // add all samples up . . .
//  }
//  adcAverage /= SAMPLE_NUMBER;        // . . . average it w/ divide
  adcAverage = (float)ADC_Value;

  /* Here we calculate the thermistor’s resistance using the equation
     discussed in the article. */
  rThermistor = BALANCE_RESISTOR / ( (MAX_ADC / adcAverage) - 1);

  /* Here is where the Beta equation is used, but it is different
     from what the article describes. Don't worry! It has been rearranged
     algebraically to give a "better" looking formula. I encourage you
     to try to manipulate the equation from the article yourself to get
     better at algebra. And if not, just use what is shown here and take it
     for granted or input the formula directly from the article, exactly
     as it is shown. Either way will work! */
  tKelvin = (BETA * ROOM_TEMP) /
            (BETA + (ROOM_TEMP * log(rThermistor / RESISTOR_ROOM_TEMP)));

  /* I will use the units of Celsius to indicate temperature. I did this
     just so I can see the typical room temperature, which is 25 degrees
     Celsius, when I first try the program out. I prefer Fahrenheit, but
     I leave it up to you to either change this function, or create
     another function which converts between the two units. */
  tCelsius = tKelvin - 273.15;  // convert kelvin to celsius

  return tCelsius;    // Return the temperature in Celsius
}
