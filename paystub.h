#ifndef PAYSTUB_H
#define PAYSTUB_H

#include <map>
#include <string>
#include <vector>

class Paystub
{
public:
    static std::vector<std::string> validKeys;
    Paystub();
    bool keyExists(std::string k);
    bool modifyKey(std::string k, double val);

private:
    std::map<std::string, int> taxes;
};

#endif // PAYSTUB_H
