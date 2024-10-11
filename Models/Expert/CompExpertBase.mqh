//+------------------------------------------------------------------+
//|                                               CompExpertBase.mqh |
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *  This class is base class for all Expert Advisors
 *================================================================================================**/

/*=========================================== Includes ===========================================*/
#include <Trade/AccountInfo.mqh>
#include <Trade/SymbolInfo.mqh>

#include "../../Enums/ENUM_COMP_INIT_PHASE.mqh"
#include "../../Enums/ENUM_USED_CHART_BUFFERS.mqh"

/*====================================== Macro definitions ======================================*/
//--- check the use of timeseries
#define IS_OPEN_SERIES_USAGE ((m_used_series & COMP_USE_SERIES_OPEN) != 0)
#define IS_HIGH_SERIES_USAGE ((m_used_series & COMP_USE_SERIES_HIGH) != 0)
#define IS_LOW_SERIES_USAGE ((m_used_series & COMP_USE_SERIES_LOW) != 0)
#define IS_CLOSE_SERIES_USAGE ((m_used_series & COMP_USE_SERIES_CLOSE) != 0)
#define IS_SPREAD_SERIES_USAGE ((m_used_series & COMP_USE_SERIES_SPREAD) != 0)
#define IS_TIME_SERIES_USAGE ((m_used_series & COMP_USE_SERIES_TIME) != 0)
#define IS_TICK_VOLUME_SERIES_USAGE ((m_used_series & COMP_USE_SERIES_TICK_VOLUME) != 0)
#define IS_REAL_VOLUME_SERIES_USAGE ((m_used_series & COMP_USE_SERIES_REAL_VOLUME) != 0)
/*=========================================== class ===========================================*/
class CompExpertBase {
   protected:
    /*------------------------------------------- Parameters -------------------------------------------*/
    ulong m_magic;                           // expert magic number
    ENUM_COMP_INIT_PHASE m_init_phase;       // the phase (stage) of initialization of object
    CSymbolInfo *m_symbol;                   // pointer to the object-symbol
    ENUM_TIMEFRAMES m_period;                // work timeframe
    CAccountInfo m_account;                  // object-deposit
    ENUM_ACCOUNT_MARGIN_MODE m_margin_mode;  // netting or hedging
    bool m_every_tick;                       // flag of starting the analysis from current (incomplete) bar
   private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/

   public:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    CompExpertBase();

    //* Destructor
    ~CompExpertBase();
    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
CompExpertBase::CompExpertBase() {

};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
CompExpertBase::~CompExpertBase() {

};
