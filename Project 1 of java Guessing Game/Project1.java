import java.util.*;
class Project1{
    public static void main(String []args){
        Random r1= new Random();
        int Computergenratednumber = r1.nextInt(100);
        Scanner sc = new Scanner(System.in);
        for(;;){ 
        System.out.println("Enter your Gussed Number");
        int guessnumber = sc.nextInt();
        if(Computergenratednumber == guessnumber){
            System.out.println("You guessed write.\n You number is :"+guessnumber);
            break;
        }else if (Computergenratednumber > guessnumber){
            System.out.println("You gussed number is too Small");
            continue;
        }else{
            System.out.println("You gussed number is too Big");
            continue;
        }
        }
    }

}