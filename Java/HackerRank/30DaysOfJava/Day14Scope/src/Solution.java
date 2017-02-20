/**
 * Created by matt on 2/20/17.
 */
import java.io.*;
import java.lang.reflect.Array;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;


class Difference {
    private int[] elements;
    public int maximumDifference;

    Difference(int[] elements) {
        this.elements = elements;
    }

    public void computeDifference() {
        // Sort array
        Arrays.sort(this.elements);
        // Compute difference between first and last elements
        this.maximumDifference = Math.abs(this.elements[0] - this.elements[this.elements.length - 1]);
    }
}


public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = sc.nextInt();
        }
        sc.close();

        Difference difference = new Difference(a);

        difference.computeDifference();

        System.out.print(difference.maximumDifference);
    }
}

/*
elements (unsorted integer array)
 | a1 | a2 | ... | an |
-|----|----|-----|----|-
 0    1    2    n-1   n

sort elements

b1 <= b2 <= ... <= bn
 | b1 | b2 | ... | bn |
-|----|----|-----|----|-
 0    1    2    n-1   n

return | bn - b1 | = | min(a) - max(a) |

 */