#include "shift.h"

Shift::Shift() {
    m_start_date = std::chrono::year_month_day();
    m_end_date = std::chrono::year_month_day();
    m_start_time = 0;
    m_end_time = 0;
    m_duration = 0;
}

Shift::Shift(date start_date, date end_date, double start_time, double end_time) {
    setStartDate(start_date);
    setEndDate(end_date);
    setStartTime(start_time);
    setEndTime(end_time);
}

bool Shift::operator==(Shift rval) {
    if (m_start_date != rval.getStartDate() ||
        m_end_date != rval.getEndDate() ||
        m_start_time != rval.getStartTime() ||
        m_end_time != rval.getEndTime()) {
        return false;
    }
    return true;
}

bool Shift::setStartDate(date day) {
    return true;
}

date Shift::getStartDate() {
    return m_start_date;
}

bool Shift::setEndDate(date day) {
    return true;
}

date Shift::getEndDate() {
    return m_end_date;
}

double Shift::getDuration() {
    return m_duration;
}

bool Shift::setStartTime(double t) {
    return true;
}

double Shift::getStartTime() {
    return m_start_time;
}

bool Shift::setEndTime(double t) {
    return true;
}

double Shift::getEndTime() {
    return m_end_time;
}
