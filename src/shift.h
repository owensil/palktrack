#ifndef SHIFT_H
#define SHIFT_H

#include <chrono>

typedef std::chrono::year_month_day date;

    class Shift
{
public:
    Shift();
    Shift(date start_date, date end_date, double start_time=-1, double end_time=-1);
    bool setStartDate();
    date getStartDate();
    bool setEndDate();
    date getEndDate();
    double getDuration();
    bool setStartTime();
    double getStartTime();
    bool setEndTime();
    double getEndTime();

private:
    std::chrono::year_month_day m_start_date;
    std::chrono::year_month_day m_end_date;
    double m_start_time;
    double m_end_time;
    double m_duration;

};

#endif // SHIFT_H
