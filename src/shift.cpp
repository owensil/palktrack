#include "shift.h"

Shift::Shift() {
    m_start_date = std::chrono::year_month_day();
    m_end_date = std::chrono::year_month_day();
    m_start_time = 0;
    m_end_time = 0;
    m_duration = 0;
}

Shift::Shift(date start_date, date end_date, double start_time, double end_time) {

}

bool setStartDate();
date getStartDate();
bool setEndDate();
date getEndDate();
double getDuration();
bool setStartTime();
double getStartTime();
bool setEndTime();
double getEndTime();
