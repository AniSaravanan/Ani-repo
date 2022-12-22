public class AccountCustomController1 {
    public Account acc{get;set;}
    public VfHistory__c vf{get;set;}  
    public AccountCustomController1(){
        acc=new Account();
    }
    public pagereference save(){
      insert acc;          
        pagereference p=new pagereference('/'+acc.Id);        
        return p;
    }       
    public void history(){
        insert vf;
        Integer Pagevisit=[select count() from VfHistory__c where CreatedDate=:system.today()];
               
         }  
  
    public pagereference saveAndNew(){
        insert acc;
        pagereference p=new pagereference('apex/AccountCustomController1'+acc.Id);
        p.setRedirect(true);  
        return p;
   
    } 
    public pagereference cancel(){
        pagereference p=new pagereference('/001/o');        
        return p;
    }

        
    
}