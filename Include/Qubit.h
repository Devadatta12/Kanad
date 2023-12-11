#pragma once

#include <cstdlib>
#include <iostream>
#include <ctime>


namespace kanad {
    enum Basis{
        X,
        Y,
        Z
    };

    enum BasisState{
        ZERO = 0,
        ONE,
    };

    class Qubit{
    public:
        Qubit()= default;
        BasisState measure(Basis);
    private:
        double Amp0=1;
        double Amp1=0;
    };
}