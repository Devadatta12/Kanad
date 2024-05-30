import org.apache.commons.math3.complex.Complex;

import java.util.Random;

public class Qubit {
    public enum BasisState{
        ZERO,
        ONE;
    }


    public Qubit(Complex amplitude0, Complex amplitude1){
        _amplitude0 = amplitude0;
        _amplitude1 = amplitude1;
        _random = new Random();
    }

    public Qubit(){
        _amplitude0 = new Complex(1, 0);
        _amplitude1 = new Complex(0, 0);
        _random = new Random();
    }

    public BasisState measure(){
        double chance =  _chance();
        double probability0 = _p0();

        if (chance <= probability0){
            return BasisState.ZERO;
        } else{
            return BasisState.ONE;
        }
    }

    private double _p0(){return Math.pow(_amplitude0.abs(), 2);}
    private double _p1(){return Math.pow(_amplitude1.abs(), 2);}
    private double _chance(){return _random.nextDouble();};
    private static final int CHANCE_MAX = 10;
    private static final double CHANCE = CHANCE_MAX;
    private final Complex _amplitude0;
    private final Complex _amplitude1;
    private final Random _random;
}
