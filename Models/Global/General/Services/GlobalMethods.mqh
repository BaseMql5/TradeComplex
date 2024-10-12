//+------------------------------------------------------------------+
//|                                                GlobalMethods.mqh |
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *  This class is use to store functions which are not implemented globaly in mql5
 *  so we implement them in this class to use them globally
 *================================================================================================**/

/*=========================================== Includes ===========================================*/
#include "../../../../Enums/ENUM_USED_TIMEFRAMES.mqh"
/*=========================================== class ===========================================*/
class GlobalMethods {
   private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/

   public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    void convertUsedTimeFramesFlag(const int i_timeFrameFlag, bool &o_usedTimeFramesArr[]) {
        ArrayResize(o_usedTimeFramesArr, 21);
        ArrayInitialize(o_usedTimeFramesArr, false);
        o_usedTimeFramesArr[0] = ((i_timeFrameFlag & PERIOD_M1_ACTIVE) != 0);
        o_usedTimeFramesArr[1] = ((i_timeFrameFlag & PERIOD_M2_ACTIVE) != 0);
        o_usedTimeFramesArr[2] = ((i_timeFrameFlag & PERIOD_M3_ACTIVE) != 0);
        o_usedTimeFramesArr[3] = ((i_timeFrameFlag & PERIOD_M4_ACTIVE) != 0);
        o_usedTimeFramesArr[4] = ((i_timeFrameFlag & PERIOD_M5_ACTIVE) != 0);
        o_usedTimeFramesArr[5] = ((i_timeFrameFlag & PERIOD_M6_ACTIVE) != 0);
        o_usedTimeFramesArr[6] = ((i_timeFrameFlag & PERIOD_M10_ACTIVE) != 0);
        o_usedTimeFramesArr[7] = ((i_timeFrameFlag & PERIOD_M12_ACTIVE) != 0);
        o_usedTimeFramesArr[8] = ((i_timeFrameFlag & PERIOD_M15_ACTIVE) != 0);
        o_usedTimeFramesArr[9] = ((i_timeFrameFlag & PERIOD_M20_ACTIVE) != 0);
        o_usedTimeFramesArr[10] = ((i_timeFrameFlag & PERIOD_M30_ACTIVE) != 0);
        o_usedTimeFramesArr[11] = ((i_timeFrameFlag & PERIOD_H1_ACTIVE) != 0);
        o_usedTimeFramesArr[12] = ((i_timeFrameFlag & PERIOD_H2_ACTIVE) != 0);
        o_usedTimeFramesArr[13] = ((i_timeFrameFlag & PERIOD_H3_ACTIVE) != 0);
        o_usedTimeFramesArr[14] = ((i_timeFrameFlag & PERIOD_H4_ACTIVE) != 0);
        o_usedTimeFramesArr[15] = ((i_timeFrameFlag & PERIOD_H6_ACTIVE) != 0);
        o_usedTimeFramesArr[16] = ((i_timeFrameFlag & PERIOD_H8_ACTIVE) != 0);
        o_usedTimeFramesArr[17] = ((i_timeFrameFlag & PERIOD_H12_ACTIVE) != 0);
        o_usedTimeFramesArr[18] = ((i_timeFrameFlag & PERIOD_D1_ACTIVE) != 0);
        o_usedTimeFramesArr[19] = ((i_timeFrameFlag & PERIOD_W1_ACTIVE) != 0);
        o_usedTimeFramesArr[20] = ((i_timeFrameFlag & PERIOD_MN1_ACTIVE) != 0);
    };

    ENUM_TIMEFRAMES getTimeFrameByIndex(const int i_index) {
        switch (i_index) {
            case 0:
                return PERIOD_M1;
            case 1:
                return PERIOD_M2;
            case 2:
                return PERIOD_M3;
            case 3:
                return PERIOD_M4;
            case 4:
                return PERIOD_M5;
            case 5:
                return PERIOD_M6;
            case 6:
                return PERIOD_M10;
            case 7:
                return PERIOD_M12;
            case 8:
                return PERIOD_M15;
            case 9:
                return PERIOD_M20;
            case 10:
                return PERIOD_M30;
            case 11:
                return PERIOD_H1;
            case 12:
                return PERIOD_H2;
            case 13:
                return PERIOD_H3;
            case 14:
                return PERIOD_H4;
            case 15:
                return PERIOD_H6;
            case 16:
                return PERIOD_H8;
            case 17:
                return PERIOD_H12;
            case 18:
                return PERIOD_D1;
            case 19:
                return PERIOD_W1;
            case 20:
                return PERIOD_MN1;
            default:
                return PERIOD_CURRENT;
        }
    };

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    GlobalMethods();

    //* Destructor
    ~GlobalMethods();
    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
GlobalMethods::GlobalMethods() {

};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
GlobalMethods::~GlobalMethods() {

};
