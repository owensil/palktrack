#include "workdatabase.h"
#include <iostream>

WorkDatabase::WorkDatabase(QObject *parent)
    : QObject{parent}
{}

void WorkDatabase::dummyMethod()
{
    std::cout << "Dummy method called" << std::endl;
}
