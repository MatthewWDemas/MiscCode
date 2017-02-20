/**
 * Created by matt on 2/13/17.
 */

import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Day10 {
//public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        // Convert integer to binary string
        String nStr = Integer.toBinaryString(n);
        int tmp_count = 0;
        int max_count = 0;
        // Iterate over string elements
        for (int i = 0; i < nStr.length(); i++) {
            // If characters i and i+1 are the same, increment temporary counter
            if (nStr.charAt(i) == '1') {
                tmp_count++;
            }
            // else check if temp_count is greater than max counter
            if (tmp_count > max_count) {
                max_count = tmp_count;
            }
            if (nStr.charAt(i) != '1') {
                tmp_count = 0;
            }
        }
        System.out.println(max_count);
    }
}


