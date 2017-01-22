/**
 * Created by matt on 1/22/17.
 */
import java.io.*;
import java.util.*;

public class Person {
    private int age;

    public Person(int initialAge) {
        // Add some more code to run some checks on initialAge
        if (initialAge < 0) {
            System.out.println("Age is not valid, setting age to 0.");
            this.age = 0;
        } else {
            this.age = initialAge;
        }
    }

    public void amIOld() {
        // Write code determining if this person's age is old and print the correct statement:
        String old_str;
        if (this.age < 13) {
            old_str = "You are young.";
        } else if (this.age >= 13 && this.age < 18) {
            old_str = "You are a teenager.";
        } else {
            old_str = "You are old.";
        }
        System.out.println(old_str);
    }

    public void yearPasses() {
        // Increment this person's age.
        this.age += 1;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int T = sc.nextInt();
        for (int i = 0; i < T; i++) {
            int age = sc.nextInt();
            Person p = new Person(age);
            p.amIOld();
            for (int j = 0; j < 3; j++) {
                p.yearPasses();
            }
            p.amIOld();
            System.out.println();
        }
        sc.close();
    }
}
