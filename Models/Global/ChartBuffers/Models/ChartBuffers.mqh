//+------------------------------------------------------------------+
//|                                                    ChartBuffers.mqh |
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *  This class used to store buffers of the chart
 *  open high low close spread time tick_volume real_volume
 *================================================================================================**/

/*=========================================== Includes ===========================================*/
#include "../../IsNewBar/Models/CisNewBar.mqh"

/*=========================================== class ===========================================*/
class ChartBuffers {
   private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/

   public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    double high[], low[], open[], close[];
    datetime time[];
    int spread[];
    int m_lastCandleIndex;
    ENUM_TIMEFRAMES m_timeframe;
    int m_ratesTotal;
    string m_symbol;
    CisNewBar m_isNewBar;

    void init(const string i_symbol, const ENUM_TIMEFRAMES i_timeFrame);

    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    ChartBuffers();

    //* Destructor
    ~ChartBuffers();
    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
ChartBuffers::ChartBuffers(const string i_symbol, const ENUM_TIMEFRAMES i_timeFrame) {

};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
ChartBuffers::~ChartBuffers() {

};

/**================================================================================================
 **                                      init
 *?  initlize the buffers
 *================================================================================================**/
void ChartBuffers::init(const string i_symbol, const ENUM_TIMEFRAMES i_timeFrame) {
    m_symbol = i_symbol;
    m_timeframe = i_timeFrame;
    m_lastCandleIndex = -1;
    m_isNewBar.SetSymbol(i_symbol);
    m_isNewBar.SetPeriod(i_timeFrame);
    m_symbol = i_symbol;
    m_timeframe = i_timeFrame;
};