package ru.Points;
public class  Points{
    public static void main(String[] args) {

        /*Comment №1*/
        Points A = new Points();
        Points B = new Points(3, 9, 'B');
        B.input();

        //Comment №2
        int someInt1, someInt2, someInt3;
        float someFloat1, someFloat2;

        System.out.println(B);
        System.out.println(A);
        System.out.println();
        System.out.println("Расстояние между точками А и В:");
        System.out.println(A.howLong(B));
    }
}

