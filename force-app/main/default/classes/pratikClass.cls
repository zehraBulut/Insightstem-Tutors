public class pratikClass {
    
 
   public static string shippingCost  = ''; 
    
    public static string  calculateShipping(string selectedShippingMethod){
        
        switch on selectedShippingMethod {
            
            when 'standart'{
                return shippingCost = '5.00 percent';
            }
              when 'express'{
                return  shippingCost = '10.00 percent';
            }
             when 'next day'{
                return  shippingCost = '15.00 percent';
            }
                       
            When else{
                return shippingCost = '7.50 percent';
            }
        }
    }
}
 /* veya 
  public class ShippingCostCalculator {

    public static Decimal calculateShippingCost(String selectedShippingMethod) {
        Decimal shippingCost;

        if (selectedShippingMethod.equals("Standard")) {
            shippingCost = 5.00;
        } else if (selectedShippingMethod.equals("Express")) {
            shippingCost = 10.00;
        } else if (selectedShippingMethod.equals("Next Day")) {
            shippingCost = 20.00;
        } else {
            shippingCost = 7.50;
        }

        return shippingCost;
    }
}

veya 

public class ShippingCostCalculator {

    public static Decimal calculateShippingCost(String selectedShippingMethod) {
        Decimal shippingCost;

        if (selectedShippingMethod == "Standard") {
            shippingCost = 5.00;
        } else if (selectedShippingMethod == "Express") {
            shippingCost = 10.00;
        } else if (selectedShippingMethod == "Next Day") {
            shippingCost = 20.00;
        } else {
            shippingCost = 7.50;
        }

        return shippingCost;
    }
}
*/