/**
 * Created by matt on 2/3/17.
 * Objective
 Today we're expanding our knowledge of Strings and combining it with what we've already learned about loops. Check out the Tutorial tab for learning materials and an instructional video!
 Task
 Given a string, , of length  that is indexed from  to , print its even-indexed and odd-indexed characters as  space-separated strings on a single line (see the Sample below for more detail).
 Note:  is considered to be an even index.
 Input Format
 The first line contains an integer,  (the number of test cases).
 Each line  of the  subsequent lines contain a String, .
 Constraints
 Output Format
 For each String  (where ), print 's even-indexed characters, followed by a space, followed by 's odd-indexed characters.
 Sample Input
 2
 Hacker
 Rank
 Sample Output

 Hce akr
 Rn ak
 Explanation:

 Test Case 0:
    The even indices are , , and , and the odd indices are , , and . We then print a single line of  space-separated strings; the first string contains the ordered characters from 's even indices (), and the second string contains the ordered characters from 's odd indices ().
 Test Case 1:
    The even indices are  and , and the odd indices are  and . We then print a single line of space-separated strings; the first string contains the ordered characters from 's even indices (), and the second string contains the ordered characters from 's odd indices ().

 */
import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Day6 {
//public class Solution {
    public static void main(String[] args) {
        /* Enter your code here. Read input from STDIN. Print output to STDOUT. Your class should be named Solution. */
        Scanner sc = new Scanner(System.in);
        // Accept integer for number of cases.
        int num_cases = sc.nextInt();
        sc.nextLine();
        String[] out_str_arr = new String[num_cases];
        for (int i = 0; i < num_cases; i++) {
            String tmp_str = "";
            // Read string from stdin
            String input_string = sc.nextLine();
            // Cast string as character array
            char[] input_char_arr = input_string.toCharArray();
            // Cycle through even characters and print without line breaks
            for (int k = 0; k < input_string.length(); k = k + 2) {
                tmp_str = tmp_str + input_char_arr[k];
            }
            // Add space
            tmp_str = tmp_str + " ";
            // Cycle through odd characters and print without line breaks
            for (int k = 1; k < input_string.length(); k = k + 2) {
                tmp_str = tmp_str + input_char_arr[k];
            }
            out_str_arr[i] = tmp_str;
        }
        for (String t : out_str_arr) {
            System.out.println(t);
        }
        sc.close();
    }
}

