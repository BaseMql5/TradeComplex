//+------------------------------------------------------------------+
//|                                            Calc_ChartBuffers.mqh |
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"
#property version "1.00"

/**================================================================================================
 * *                                           Description
 *  This class used to calculate buffers of the chart
 *
 *================================================================================================**/
/*=========================================== Includes ===========================================*/
#include "../../../../Enums/ENUM_USED_CHART_BUFFERS.mqh"
#include "../../Storage/Models/Vector.mqh"
#include "../Models/ChartBuffers.mqh"
/*====================================== Macro definitions ======================================*/
//--- check the use of timeseries
#define IS_OPEN_BUFFER_USAGE ((m_usedSeries & COMP_USE_SERIES_OPEN) != 0)
#define IS_HIGH_BUFFER_USAGE ((m_usedSeries & COMP_USE_SERIES_HIGH) != 0)
#define IS_LOW_BUFFER_USAGE ((m_usedSeries & COMP_USE_SERIES_LOW) != 0)
#define IS_CLOSE_BUFFER_USAGE ((m_usedSeries & COMP_USE_SERIES_CLOSE) != 0)
#define IS_SPREAD_BUFFER_USAGE ((m_usedSeries & COMP_USE_SERIES_SPREAD) != 0)
#define IS_TIME_BUFFER_USAGE ((m_usedSeries & COMP_USE_SERIES_TIME) != 0)
#define IS_TICK_VOLUME_BUFFER_USAGE ((m_usedSeries & COMP_USE_SERIES_TICK_VOLUME) != 0)
#define IS_REAL_VOLUME_BUFFER_USAGE ((m_usedSeries & COMP_USE_SERIES_REAL_VOLUME) != 0)
/*=========================================== class ===========================================*/
class Calc_ChartBuffers {
   private:
    /*------------------------------------------- Parameters -------------------------------------------*/
    int m_chunkSize;
    int m_usedSeries;
    /*------------------------------------------- Methods -------------------------------------------*/

   public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    // Initialization method: initializes the arrays and copies historical data
    bool init(const string i_symbol, const ENUM_TIMEFRAMES i_timeFrame,
              ChartBuffers &i_chartBuffers,
              const int i_numHistoricalCandles, const int i_usedSeries,
              const int i_chunkSize = 100);
    bool init(const string &i_symbols[], const ENUM_TIMEFRAMES &i_timeFrame[],
              Vector<ChartBuffers *> *i_chartBuffers, const int i_numHistoricalCandles, const int i_usedSeries,
              const int i_chunkSize = 100);

    // Update method: updates the arrays with the new data
    bool update(ChartBuffers &i_chartBuffers);
    bool update(Vector<ChartBuffers *> *i_chartBuffers);
    /*------------------------------------------- Methods -------------------------------------------*/
    //*  Constructor
    Calc_ChartBuffers();

    //* Destructor
    ~Calc_ChartBuffers();
    /*------------------------------------------- Getters -------------------------------------------*/
};

/**================================================================================================
 * *                                      Normal   Constructor
 *================================================================================================**/
Calc_ChartBuffers::Calc_ChartBuffers() {

};

/**================================================================================================
 * *                                  Normal Destructor
 *
 *================================================================================================**/
Calc_ChartBuffers::~Calc_ChartBuffers() {

};

/**================================================================================================
 **                                      init
 *?  Initilize data to calculate chart buffers
 *@param i_symbol, i_numHistoricalCandles, i_chartBuffers, i_timeFrame, i_calcTime, i_calcHigh,
  i_calcLow, i_calcOpen, i_calcClose, i_calcSpread, i_chunkSize
 *@return false if failed to initilize
 *================================================================================================**/
bool Calc_ChartBuffers::init(const string i_symbol, const ENUM_TIMEFRAMES i_timeFrame,
                             ChartBuffers &i_chartBuffers,
                             const int i_numHistoricalCandles, const int i_usedSeries,
                             const int i_chunkSize = 100) {
    //* init ChartBuffers
    i_chartBuffers.init(i_symbol, i_timeFrame);
    //* init Calc_ChartBuffers
    m_chunkSize = i_chunkSize;
    m_usedSeries = i_usedSeries;
    int availableCandles = Bars(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe);  // Get the number of available candles
    int candlesToCopy = MathMin(i_numHistoricalCandles, availableCandles);
    i_chartBuffers.m_ratesTotal = candlesToCopy;
    // Resize arrays to hold the historical data + m_chunkSize for future candles
    if (IS_HIGH_BUFFER_USAGE) ArrayResize(i_chartBuffers.high, candlesToCopy + m_chunkSize);
    if (IS_LOW_BUFFER_USAGE) ArrayResize(i_chartBuffers.low, candlesToCopy + m_chunkSize);
    if (IS_OPEN_BUFFER_USAGE) ArrayResize(i_chartBuffers.open, candlesToCopy + m_chunkSize);
    if (IS_CLOSE_BUFFER_USAGE) ArrayResize(i_chartBuffers.close, candlesToCopy + m_chunkSize);
    if (IS_TIME_BUFFER_USAGE) ArrayResize(i_chartBuffers.time, candlesToCopy + m_chunkSize);
    if (IS_SPREAD_BUFFER_USAGE) ArrayResize(i_chartBuffers.spread, candlesToCopy + m_chunkSize);

    bool result = true;
    // Copy the data for the specified number of candles
    if (IS_HIGH_BUFFER_USAGE) {
        ResetLastError();
        if (CopyHigh(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0, candlesToCopy, i_chartBuffers.high) < 0) {
            Print("Error in CopyHigh copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
            result = false;
        }
    }
    if (IS_LOW_BUFFER_USAGE) {
        ResetLastError();
        if (CopyLow(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0, candlesToCopy, i_chartBuffers.low) < 0) {
            Print("Error in CopyLow copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
            result = false;
        }
    }
    if (IS_OPEN_BUFFER_USAGE) {
        ResetLastError();
        if (CopyOpen(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0, candlesToCopy, i_chartBuffers.open) < 0) {
            Print("Error in CopyOpen copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
            result = false;
        }
    }
    if (IS_CLOSE_BUFFER_USAGE) {
        ResetLastError();
        if (CopyClose(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0, candlesToCopy, i_chartBuffers.close) < 0) {
            Print("Error in CopyClose copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
            result = false;
        }
    }
    if (IS_TIME_BUFFER_USAGE) {
        ResetLastError();
        if (CopyTime(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0, candlesToCopy, i_chartBuffers.time) < 0) {
            Print("Error in CopyTime copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
            result = false;
        }
    }
    if (IS_SPREAD_BUFFER_USAGE) {
        ResetLastError();
        if (CopySpread(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0, candlesToCopy, i_chartBuffers.spread) < 0) {
            Print("Error in CopySpread copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
            result = false;
        }
    }
    // Set m_lastCandleIndex to the last element of the time array
    i_chartBuffers.m_lastCandleIndex = candlesToCopy - 1;
    return result;
};

/**================================================================================================
 **                                      init ** overloading
 *?  Initilize data to calculate chart buffers in a vector of ChartBuffers
 *@param i_symbol, i_numHistoricalCandles, i_chartBuffers, i_timeFrame, i_calcTime, i_calcHigh,
  i_calcLow, i_calcOpen, i_calcClose, i_calcSpread, i_chunkSize
 *@return false if failed to initilize
 *================================================================================================**/
bool Calc_ChartBuffers::init(const string &i_symbols[], const ENUM_TIMEFRAMES &i_timeFrame[],
                             Vector<ChartBuffers *> *i_chartBuffers, const int i_numHistoricalCandles, const int i_usedSeries,
                             const int i_chunkSize = 100) {
    //* check sizes
    if (ArraySize(i_symbols) != ArraySize(i_timeFrame) || ArraySize(i_symbols) != i_chartBuffers.size()) {
        Print("Error in Calc_ChartBuffers::init: Sizes of input arrays do not match");
        return false;
    }
    bool result = true;
    for (int i = 0; i < i_chartBuffers.size(); i++) {
        result *= init(i_symbols[i], i_timeFrame[i], i_chartBuffers[i], i_numHistoricalCandles, i_usedSeries, i_chunkSize);
    }
    return result;
};

/**================================================================================================
 **                                      update
 *?  Update data to calculate chart buffers
 *@return false if failed to update
 *================================================================================================**/
// UpdateData method: updates arrays with new ticks and resizes them if necessary
bool Calc_ChartBuffers::update(ChartBuffers &i_chartBuffers) {
    // set result to true
    bool result = true;
    // Fetch the current bar's time (the most recent candle)
    int newBarsCount = i_chartBuffers.m_isNewBar.isNewBar();
    i_chartBuffers.m_ratesTotal = i_chartBuffers.m_lastCandleIndex + newBarsCount + 1;
    // Check if we are still in the same candle or if a new one has formed
    if (newBarsCount == 0) {
        // The candle is still the same; update it
        if (IS_HIGH_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.high[i_chartBuffers.m_lastCandleIndex] = iHigh(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0);
            if (i_chartBuffers.high[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iHigh copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_LOW_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.low[i_chartBuffers.m_lastCandleIndex] = iLow(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0);
            if (i_chartBuffers.low[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iLow copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_OPEN_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.open[i_chartBuffers.m_lastCandleIndex] = iOpen(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0);
            if (i_chartBuffers.open[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iOpen copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_CLOSE_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.close[i_chartBuffers.m_lastCandleIndex] = iClose(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0);
            if (i_chartBuffers.close[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iClose copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_TIME_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.time[i_chartBuffers.m_lastCandleIndex] = iTime(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0);
            if (i_chartBuffers.time[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iTime copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_SPREAD_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.spread[i_chartBuffers.m_lastCandleIndex] = iSpread(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, 0);
            if (i_chartBuffers.spread[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iSpread copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        return result;
    }

    // Else a new candle has formed
    i_chartBuffers.m_lastCandleIndex++;  // Move to the new candle index
    for (i_chartBuffers.m_lastCandleIndex; i_chartBuffers.m_lastCandleIndex < i_chartBuffers.m_ratesTotal; i_chartBuffers.m_lastCandleIndex++) {
        // Check if arrays need to be resized
        if (i_chartBuffers.m_lastCandleIndex >= ArraySize(i_chartBuffers.high)) {
            // Resize arrays by m_chunkSize if needed
            if (IS_HIGH_BUFFER_USAGE)
                ArrayResize(i_chartBuffers.high, ArraySize(i_chartBuffers.high) + m_chunkSize);
            if (IS_LOW_BUFFER_USAGE)
                ArrayResize(i_chartBuffers.low, ArraySize(i_chartBuffers.low) + m_chunkSize);
            if (IS_OPEN_BUFFER_USAGE)
                ArrayResize(i_chartBuffers.open, ArraySize(i_chartBuffers.open) + m_chunkSize);
            if (IS_CLOSE_BUFFER_USAGE)
                ArrayResize(i_chartBuffers.close, ArraySize(i_chartBuffers.close) + m_chunkSize);
            if (IS_TIME_BUFFER_USAGE)
                ArrayResize(i_chartBuffers.time, ArraySize(i_chartBuffers.time) + m_chunkSize);
            if (IS_SPREAD_BUFFER_USAGE)
                ArrayResize(i_chartBuffers.spread, ArraySize(i_chartBuffers.spread) + m_chunkSize);
        }

        // Insert the new candle data at m_lastCandleIndex position
        if (IS_HIGH_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.high[i_chartBuffers.m_lastCandleIndex] = iHigh(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, i_chartBuffers.m_ratesTotal - i_chartBuffers.m_lastCandleIndex - 1);
            if (i_chartBuffers.high[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iHigh copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_LOW_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.low[i_chartBuffers.m_lastCandleIndex] = iLow(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, i_chartBuffers.m_ratesTotal - i_chartBuffers.m_lastCandleIndex - 1);
            if (i_chartBuffers.low[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iHigh copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_OPEN_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.open[i_chartBuffers.m_lastCandleIndex] = iOpen(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, i_chartBuffers.m_ratesTotal - i_chartBuffers.m_lastCandleIndex - 1);
            if (i_chartBuffers.open[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iHigh copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_CLOSE_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.close[i_chartBuffers.m_lastCandleIndex] = iClose(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, i_chartBuffers.m_ratesTotal - i_chartBuffers.m_lastCandleIndex - 1);
            if (i_chartBuffers.close[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iHigh copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_TIME_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.time[i_chartBuffers.m_lastCandleIndex] = iTime(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, i_chartBuffers.m_ratesTotal - i_chartBuffers.m_lastCandleIndex - 1);
            if (i_chartBuffers.time[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iHigh copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
        if (IS_SPREAD_BUFFER_USAGE) {
            ResetLastError();
            i_chartBuffers.spread[i_chartBuffers.m_lastCandleIndex] = iSpread(i_chartBuffers.m_symbol, i_chartBuffers.m_timeframe, i_chartBuffers.m_ratesTotal - i_chartBuffers.m_lastCandleIndex - 1);
            if (i_chartBuffers.spread[i_chartBuffers.m_lastCandleIndex] <= 0) {
                Print("Error in iHigh copying data: ", GetLastError(), " file ", __FILE__, " line ", __LINE__);
                result = false;
            }
        }
    }
    i_chartBuffers.m_lastCandleIndex = i_chartBuffers.m_ratesTotal - 1;

    return result;
};

/**================================================================================================
 **                                      update ** overloading
 *?  Update data to calculate chart buffers in a vector of ChartBuffers
 *@return false if failed to update
 *================================================================================================**/
bool Calc_ChartBuffers::update(Vector<ChartBuffers *> *i_chartBuffers) {
    bool result = 1;
    for (int i = 0; i < i_chartBuffers.size(); i++) {
        result *= update(*i_chartBuffers[i]);
    }
    return result;
};