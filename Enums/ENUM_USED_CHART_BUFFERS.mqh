//+------------------------------------------------------------------+
//|                                          ENUM_USED_CHART_BUFFERS.mqh|
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *   flags of used timeseries
 * ! Not yet Implemented Totally
 *================================================================================================**/

/*=========================================== Includes ===========================================*/

/*=========================================== ENUM ===========================================*/

enum ENUM_USED_CHART_BUFFERS {
    COMP_USE_SERIES_OPEN = 0x1,
    COMP_USE_SERIES_HIGH = 0x2,
    COMP_USE_SERIES_LOW = 0x4,
    COMP_USE_SERIES_CLOSE = 0x8,
    COMP_USE_SERIES_SPREAD = 0x10,
    COMP_USE_SERIES_TIME = 0x20,
    COMP_USE_SERIES_TICK_VOLUME = 0x40,
    COMP_USE_SERIES_REAL_VOLUME = 0x80
};