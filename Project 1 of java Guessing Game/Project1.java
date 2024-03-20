import java.util.*;
class Project1{
    public static void main(String []args){
        char  s1=0,s2=0 ; 
        Random r1= new Random();
        int Computergenratednumber = r1.nextInt(100);
        Scanner sc = new Scanner(System.in);
        System.out.println("Press Y to play Game");
        s1 = sc.next().charAt(0);
        System.out.println("Guess Number Between 0 to 100 ");
        for(;;){ 
            try{
                int guessnumber = sc.nextInt();
                System.out.println(guessnumber);
                if(s1 == 'Y'||s1 == 'y'){       
                    if(Computergenratednumber == guessnumber){
                        System.out.println("You guessed right.\n You number is : "+guessnumber);
                        break;
                    }else if (Computergenratednumber > guessnumber){
                        System.out.println("You gussed number is too Small");
                        System.out.println("Guess again");
                        continue;
                    }else{
                        System.out.println("You gussed number is too Big");
                        System.out.println("Guess again");
                        continue;
                    }
                }  
             }catch(InputMismatchException i){
                System.out.println("Please Enter a valid input ");
                System.out.println("Do you want to play again");
                System.out.println("If yes press Y");
                s2 = sc.next().charAt(0);
                System.out.println(s2);
                if(s2 =='Y'||s2 == 'y'){
                continue;
                }else{
                    System.out.println("Thank you for Playing");
                    break;
                } 
             }
              
        }
    }
}
   

