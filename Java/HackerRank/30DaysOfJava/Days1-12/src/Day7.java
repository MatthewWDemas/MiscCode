/**
 * Created by matt on 2/11/17.
 */

import java.io.*;
import java.util.*;

public class Day7 {
//    public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int[] arr = new int[n];
        for(int i=0; i < n; i++){
            arr[i] = in.nextInt();
        }
        in.close();

        for(int i = n-1; i >= 0; i = i - 1) {
            System.out.print(arr[i]);
            System.out.print(' ');
        }
    }
}
