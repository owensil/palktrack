#include "paystub.h"

Paystub::Paystub() {}

static std::vector<std::string> validKeys = {
      "tax_federal",
      "tax_state",
      "tax_socsec",
      "tax_medicare",
      "tax_other"
  };
