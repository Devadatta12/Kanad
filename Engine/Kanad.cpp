#include "ctime"
#include "cstdlib"
#include "Qubit.h"

int main(){
    srand(time(0));
    kanad::Qubit qubit;
    std::cout<<"Measure: "<<qubit.measure()<<std::endl;

    return 0;
}