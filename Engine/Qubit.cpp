#include "Qubit.h"

namespace kanad{
    BasisState Qubit::measure(Basis) {
        double chance = rand()%100;
        if (chance <= (Amp0*100)){
            return ZERO;
        } else{
            return ONE;
        }
    }

}