#ifndef WORKDATABASE_H
#define WORKDATABASE_H

#include <QObject>
#include <chrono>
#include "paystub.h"

class WorkDatabase : public QObject
{
    Q_OBJECT
public:
    explicit WorkDatabase(QObject *parent = nullptr);

    /*
     * Add a paystub to the DB.
     */
    bool addPaystub(Paystub stub);

    /*
     * Remove a paystub from the DB.
     */
    bool removePaystub(int paystub_id);

    /*
     * Get a paystub from the DB.
     */
    Paystub getPaystub(int paystub_id);

    /*
     * Get a paystub from the DB using the date of the stub.
    */
    Paystub getPaystub(std::chrono::year_month_day date);

    bool addShift();
    bool removeShift();

signals:
};

#endif // WORKDATABASE_H
