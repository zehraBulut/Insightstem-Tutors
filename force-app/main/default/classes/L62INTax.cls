public class L62INTax implements L62ABDRules{
    
    public static void display(){
        system.debug('This method is only my');
    }

    public Double fedaralTax(){
        return 2.5;
    }
      public Double stateTax(){
        return 0.03;
    }
    public Integer myMethod(){
        return 2;
    }
}