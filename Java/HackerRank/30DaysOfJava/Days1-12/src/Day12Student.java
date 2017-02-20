/**
 * Created by matt on 2/16/17.
 */
public class Day12Student extends Day12Person {
//class Student extends Day12Person/**/{
    private int[] testScores;

    /*
    *   Class Constructor
    *
    *   @param firstName - A string denoting the Person's first name.
    *   @param lastName - A string denoting the Person's last name.
    *   @param id - An integer denoting the Person's ID number.
    *   @param scores - An array of integers denoting the Person's test scores.
    */
    // Write your constructor here
    Day12Student(String firstName, String lastName, int id, int[] scores) {
        // this.firstName = firstName;
        super(firstName, lastName, id);
        // this.lastName = lastName;
        // this.idNumber = id;
        this.testScores = scores;
    }
    /*
    *   Method Name: calculate
    *   @return A character denoting the grade.
    */
    // Write your method here
    public char calculate() {
        int n = this.testScores.length;
        double mean = 0.0;
        char grade;
        for (int i = 0; i < n; i++) {
            mean += (double) this.testScores[i]/n;
        }
        if (mean <= 100 & mean >= 90) {
            grade = 'O';
        } else if (mean < 90 & mean >= 80) {
            grade = 'E';
        } else if (mean < 80 & mean >= 70) {
            grade = 'A';
        } else if (mean < 70 & mean >= 55) {
            grade = 'P';
        } else if (mean < 55 & mean >= 40) {
            grade = 'D';
        } else {
            grade = 'T';
        }
        return grade;
    }
}
