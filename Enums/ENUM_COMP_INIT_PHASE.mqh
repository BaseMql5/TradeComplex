//+------------------------------------------------------------------+
//|                                          ENUM_COMP_INIT_PHASE.mqh|
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *  Show Initialization Phase of the Expert
 * ! Not yet Implemented Totally
 *================================================================================================**/

/*=========================================== Includes ===========================================*/

/*=========================================== ENUM ===========================================*/

enum ENUM_COMP_INIT_PHASE {
    COMP_INIT_PHASE_FIRST = 0,       // start phase (only Init(...) can be called)
    COMP_INIT_PHASE_TUNING = 1,      // phase of tuning (set in Init(...))
    COMP_INIT_PHASE_VALIDATION = 2,  // phase of checking of parameters(set in ValidationSettings(...))
    COMP_INIT_PHASE_COMPLETE = 3     // end phase (set in InitIndicators(...))
};