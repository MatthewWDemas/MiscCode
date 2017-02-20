/** * Created by matt on 2/15/17.
 */
import java.io.*;
import java.util.*;
import java.text.*;
import java.math.*;
import java.util.regex.*;

public class Day11 {
//public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int arr[][] = new int[6][6];
        int hourglass_arr[] = new int[16];
        for(int i=0; i < 6; i++){
            for(int j=0; j < 6; j++){
                arr[i][j] = in.nextInt();
            }
        }
        // Obtain values sums of all hourglasses
        // Define hourglass:
        // Define coordinate system origin at (i,j)
        //   hour_glass(i,j) defined for all i, j such that
        //       i < max_len - 2 & j < max_len - 2
        // Define Hourglass Sum
        //   Accepts: defined origins
        //   Adds:
        //       (i,j), (i,j+1), (i,j+2), (i+1,j+1), (i+2,j), (i+2,j+1), (i+2,j+2)
        //   Returns: sum
        // Stores hourglass sums in new 1D array at 4*i + j
        for(int i=0; i < 4; i++){
            for(int j=0; j < 4; j++){
                hourglass_arr[4*i+j] = arr[i][j] + arr[i][j+1] + arr[i][j+2] + arr[i+1][j+1] + arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2];
            }
        }
        // Finds minimum value of array of hourglass sums.
        Arrays.sort(hourglass_arr);
        System.out.println(hourglass_arr[15]);
    }
}
//   0     1     2     3     4     5     6
// 0-|-----|-----|-----|-----|-----|-----|-0
//   | 0,0 | 0,1 | 0,2 | 0,3 | 0,4 | 0,5 |
// 1-|-----|-----|-----|-----|-----|-----|-1
//   | 1,0 | 1,1 | 1,2 | 1,3 | 1,4 | 1,5 |
// 2-|-----|-----|-----|-----|-----|-----|-2
//   | 2,0 | 2,1 | 2,2 | 2,3 | 2,4 | 2,5 |
// 3-|-----|-----|-----|-----|-----|-----|-3
//   | 3,0 | 3,1 | 3,2 | 3,3 | 3,4 | 3,5 |
// 4-|-----|-----|-----|-----|-----|-----|-4
//   | 4,0 | 4,1 | 4,2 | 4,3 | 4,4 | 4,5 |
// 5-|-----|-----|-----|-----|-----|-----|-5
//   | 5,0 | 5,1 | 5,2 | 5,3 | 5,4 | 5,5 |
// 6-|-----|-----|-----|-----|-----|-----|-6
//   0     1     2     3     4     5     6

