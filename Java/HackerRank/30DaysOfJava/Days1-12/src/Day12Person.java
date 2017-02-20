/**
 * Created by matt on 2/16/17.
 */

import java.util.*;

public class Day12Person {
//class Person {
    protected String firstName;
    protected String lastName;
    protected int idNumber;

    // Constructor
    Day12Person(String firstName, String lastName, int identification){
        this.firstName = firstName;
        this.lastName = lastName;
        this.idNumber = identification;
    }

    // Print person data
    public void printPerson(){
        System.out.println(
                "Name: " + lastName + ", " + firstName
                        + 	"\nID: " + idNumber);
    }

}