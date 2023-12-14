#include "Qubit.h"

namespace kanad{
    BasisState Qubit::measure() {
        double chance =  _chance();
        double probability0 = _p0();
        if (chance <= probability0){
            return ZERO;
        } else{
            return ONE;
        }
    }

}