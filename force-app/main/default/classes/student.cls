public class student {
    public string stuname= 'abc';
    public Integer  age=20;
    public Date dob=date.newInstance(2022, 08, 15);
    public String fatherName='xyz';
    
    public void intCal(Decimal pamt,Integer tenure,Decimal roi){
        system.debug('Student Name:'+stuname);
        system.debug('Student age:'+age);
        system.debug('Student Date Of birth:'+dob);
        system.debug('Student Father Name:'+fathername);
        system.debug('Amount:'+pamt);
        system.debug('Tenure:'+tenure);
        system.debug('Rate mof Interest:'+roi);
        Decimal totalAmount=0;
        Int_Rate IR=new Int_Rate();
        totalAmount=IR.InterestRateCalculation(pamt,tenure,roi);
        system.debug('Total Amount:'+totalAmount);
        
    }
    
}