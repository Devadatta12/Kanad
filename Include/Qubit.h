#pragma once

#include <cstdlib>
#include <iostream>
#include <ctime>
#include <complex>


namespace kanad {

    enum BasisState{
        ZERO,
        ONE
    };

    class Qubit{
    public:
        constexpr const static int CHANCE_MAX = 10;
        constexpr const static double CHANCE = CHANCE_MAX;
        Qubit()= default;
        BasisState measure();
    private:
        double _p0(){return pow(abs(Amp0), 2);};
        double _p1(){return pow(abs(Amp1), 2);};
        static double _chance(){return ((double)(rand() % CHANCE_MAX))/CHANCE;};
        std::complex<double> Amp0{1/ sqrt(2),0};
        std::complex<double> Amp1{1/ sqrt(2),0};
    };
}