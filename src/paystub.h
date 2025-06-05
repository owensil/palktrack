#ifndef PAYSTUB_H
#define PAYSTUB_H

#include <map>
#include <string>

class Paystub
{
public:
    Paystub();

private:
    std::map<std::string, int> taxes;
};

#endif // PAYSTUB_H
