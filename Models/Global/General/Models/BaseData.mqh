//+------------------------------------------------------------------+
//|                                                    BaseData.mqh |
//|                                    Copyright 2024, Mobin Zarekar |
//|                                       https://www.plusonefx.net/ |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Mobin Zarekar"
#property link "https://www.plusonefx.net/"

/**================================================================================================
 * *                                           Description
 *  BaseData class Includes common parameters
 *================================================================================================**/
/*=========================================== Includes ===========================================*/

/*=========================================== class ===========================================*/
class BaseData {
   protected:
   private:
    /*------------------------------------------- Parameters -------------------------------------------*/

    /*------------------------------------------- Methods -------------------------------------------*/

   public:
    /*------------------------------------------- Parameters -------------------------------------------*/
    string m_symbol_name;
    ENUM_TIMEFRAMES m_time_frame;
    long m_chart_id;
    /*------------------------------------------- Methods -------------------------------------------*/
    BaseData() {};   //  Normal Constructor
    ~BaseData() {};  // Destructor
    /*------------------------------------------- Getters and Setters -------------------------------------------*/
    string symbol_Name(void) { return m_symbol_name; };
    void symbol_Name(string i_symbol_name) { m_symbol_name = i_symbol_name; };
    ENUM_TIMEFRAMES time_Frame(void) { return m_time_frame; };
    void time_Frame(ENUM_TIMEFRAMES i_time_frame) { m_time_frame = i_time_frame; };
    long chart_Id(void) { return m_chart_id; };
};
