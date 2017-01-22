import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Solution {
    public static void main(String[] args) {
        int arr_tot = 0;
        double mean;
        double median;
        int mode;

        // Create a scanner to read input from STDIN.
        Scanner scan = new Scanner(System.in);

        // Read in the number of elements in the array as an integer.
        int len_arr = scan.nextInt();

        // Read in the array.
        int[] arr = new int[len_arr];
        for(int i=0; i < len_arr; i++) {
            arr[i] = scan.nextInt();
        }

        scan.close();

        // Sort the array in ascending order.
        Arrays.sort(arr);

        // Compute the mean.
        for (int i: arr) {
            arr_tot += i;
        }
        mean = arr_tot/len_arr;

        // Compute the median.
        // If the number of elements is odd. Return the ceil(N/2)th element of the array.
        if (len_arr % 2 == 1){
            median = arr[len_arr/2];
        } else {
            median = (arr[len_arr/2] + arr[len_arr/2 - 1])/2;
        }

        System.out.println(mean);
        System.out.println(median);

        // Compute the mode.
        // Get all unique elements in the array (sorted).
        // For each element in the unique array, count the number of instances of that element.
//        int[] unq_arr;
//        int unq_arr_ind;
//        for (i=0; i == len_arr; i++;) {
//
//            unq_arr[unq_arr_ind] = arr[i];
//        }
//        mean = arr_tot/len_arr;


        // ?Store the most recent index to use as a starting point for the next starting instance
    }
}