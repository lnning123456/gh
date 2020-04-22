package com.ln;


import java.util.List;

public class MyTest {
    public static void main(String[] args) {
        G g = new G();
        g.eat();
    }
}

interface S {
    void eat();
}

interface  L extends S{}
interface  H extends S{}
class G implements L{

    public void eat(String s) {

    }

    @Override
    public void eat() {

    }
}


