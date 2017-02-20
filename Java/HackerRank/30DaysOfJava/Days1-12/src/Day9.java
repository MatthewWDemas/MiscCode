/**
 * Created by matt on 2/13/17.
 */
import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Day9 {
    private static int factorial(int n) {
        if (n != 1) {
            return n * factorial(n - 1);
        } else {
            return n;
        }
    }
    public static void main(String[] args) {
        // Create Scanner
        Scanner sc = new Scanner(System.in);
        // Accept integer to compute factorial of
        int n = sc.nextInt();
        // Call factorial
        int n_fact = factorial(n);
        // Output value of factorial
        System.out.println(n_fact);
        // Close Scanner
        sc.close();
    }
}
