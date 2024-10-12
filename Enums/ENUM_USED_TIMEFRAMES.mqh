//+------------------------------------------------------------------+
//|                                          ENUM_USED_TIMEFRAMES.mqh|
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *   flags of used timeframes
 *================================================================================================**/

/*=========================================== Includes ===========================================*/

/*=========================================== ENUM ===========================================*/

enum ENUM_USED_TIMEFRAMES {
    PERIOD_M1_ACTIVE = (1 << 0),    // 1 minute
    PERIOD_M2_ACTIVE = (1 << 1),    // 2 minutes
    PERIOD_M3_ACTIVE = (1 << 2),    // 3 minutes
    PERIOD_M4_ACTIVE = (1 << 3),    // 4 minutes
    PERIOD_M5_ACTIVE = (1 << 4),    // 5 minutes
    PERIOD_M6_ACTIVE = (1 << 5),    // 6 minutes
    PERIOD_M10_ACTIVE = (1 << 6),   // 10 minutes
    PERIOD_M12_ACTIVE = (1 << 7),   // 12 minutes
    PERIOD_M15_ACTIVE = (1 << 8),   // 15 minutes
    PERIOD_M20_ACTIVE = (1 << 9),   // 20 minutes
    PERIOD_M30_ACTIVE = (1 << 10),  // 30 minutes
    PERIOD_H1_ACTIVE = (1 << 11),   // 1 hour
    PERIOD_H2_ACTIVE = (1 << 12),   // 2 hours
    PERIOD_H3_ACTIVE = (1 << 13),   // 3 hours
    PERIOD_H4_ACTIVE = (1 << 14),   // 4 hours
    PERIOD_H6_ACTIVE = (1 << 15),   // 6 hours
    PERIOD_H8_ACTIVE = (1 << 16),   // 8 hours
    PERIOD_H12_ACTIVE = (1 << 17),  // 12 hours
    PERIOD_D1_ACTIVE = (1 << 18),   // 1 day
    PERIOD_W1_ACTIVE = (1 << 19),   // 1 week
    PERIOD_MN1_ACTIVE = (1 << 20)   // 1 month
};