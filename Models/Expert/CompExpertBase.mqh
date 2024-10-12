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
#include "../Global/ChartBuffers/Models/ChartBuffers.mqh"
#include "../Global/General/Services/GlobalMethods.mqh"
#include "../Global/Storage/Models/Vector.mqh"
/*=========================================== class ===========================================*/
class CompExpertBase : public GlobalMethods {
   protected:
    /*------------------------------------------- Parameters -------------------------------------------*/
    ulong m_magic;                           // expert magic number
    ENUM_COMP_INIT_PHASE m_initPhase;        // the phase (stage) of initialization of object //? what for?
    Vector<CSymbolInfo *> *m_symbols;        // Vector of pointers to the object-symbols
    int m_periodFlags;                       // work timeframes, know if expert will work on one or more timeframes
    CAccountInfo m_account;                  // object-deposit
    ENUM_ACCOUNT_MARGIN_MODE m_marginMode;   // netting or hedging
    bool m_everyTick;                        // flag of starting the analysis from current (incomplete) bar
    Vector<ChartBuffers *> *m_bufferSeries;  // Vector of the class of buffers of the chart for different timeframes
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

    //* Initialization of the expert
    virtual void Init(const string i_symbol, const int i_timeFramesFlag);      //? why used virtual in here?
    virtual void Init(const string &i_symbols[], const int i_timeFramesFlag);  //? why used virtual in here?

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

/**================================================================================================
 **                                      Init
 *?  initlize the expert
 * overload 1 : use one string as one symbol
 *================================================================================================**/
void CompExpertBase::Init(const string i_symbol, const int i_timeFramesFlag) {
    m_symbols = new Vector<CSymbolInfo *>();
    m_symbols.Add(new CSymbolInfo());
    m_periodFlags = i_timeFramesFlag;
    m_initPhase = COMP_INIT_PHASE_FIRST;  //.! what is for? Not used yet
    bool activeFts[21];

    convertUsedTimeFramesFlag(i_timeFramesFlag, activeFts);
    for (int i = 0; i < 21; ++i) {
        if (activeFts[i]) {
            m_bufferSeries.Add(new ChartBuffers());
            m_bufferSeries[m_bufferSeries.size() - 1].init(i_symbol, getTimeFrameByIndex(i));
        }
    }
};