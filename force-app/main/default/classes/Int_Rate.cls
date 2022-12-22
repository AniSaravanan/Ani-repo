public class Int_Rate {
   
       
    
   public Decimal InterestRateCalculation(Decimal pAmount, Integer tYear,Decimal intRate){
         system.debug('Princliple Amount:'+pAmount);
         system.debug('Tenure Year:'+tYear);
         system.debug('Interest Rate:'+intRate);        
         Decimal interestAmt = (pAmount*tYear*intRate)/100;
         system.debug('Total Interest:'+interestAmt);      
         Decimal totalAmount = ( pAmount+interestAmt);
         system.debug('Total Amount:'+totalAmount);  
         return totalAmount;          

      
   } 
}