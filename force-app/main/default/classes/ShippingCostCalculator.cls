public class ShippingCostCalculator {

    public static Decimal calculateShippingCost(String selectedShippingMethod) {
        Decimal shippingCost;

        switch on selectedShippingMethod {
            when 'Standard' {
                shippingCost = 5.00;
            }
            when 'Express' {
                shippingCost = 10.00;
            }
            when 'Next Day' {
                shippingCost = 20.00;
            }
            when else {
                shippingCost = 7.50;
            }
        }

        return shippingCost;
    }
}