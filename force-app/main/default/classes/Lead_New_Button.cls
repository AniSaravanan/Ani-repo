public class Lead_New_Button {
    public Lead newLead {set;get;}
    public Lead_New_Button(ApexPages.StandardController controller){
        newLead=(Lead)controller.getRecord();
    }
    public PageReference create(){
        pageReference p;
        //1.check for duplicate in lead
    Integer count=[select count() from lead where company=:newLead.Company or lastName=:newLead.LastName];
        if(count>0){
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.WARNING,'Duplicate lead found');
            ApexPages.addMessage(msg);
        }else{
            //If duplicate lead is not found
            //check the accounts with same companyname available or not
            list<Account> accounts=[select id from Account where name=:newLead.company];
            if(accounts.size()>0){
                contact con= new contact();
                con.LastName=newLead.lastName;
                con.FirstName=newLead.firstName;
                con.Phone=newLead.phone;
                con.Email=newLead.email;
                con.AccountId=accounts[0].Id;
                insert con;
                p=new pageReference('/'+accounts[0].Id);
            }else{
                //check for the duplicate in contact
                list<contact> contacts=[select id from contact where lastName=:newLead.lastName and email=:newLead.email];
                if( contacts.size()>0){
                    Account acc= new Account();
                    acc.Name=newLead.company;
                    acc.Industry=newLead.Industry;
                    insert acc;
                    acc.id=contacts[0].AccountId;
                    update contacts;
                   p=new pageReference('/'+acc.Id);  
                }else{
                    insert newLead;
                    p=new pageReference('/'+newLead.Id);
                }
            }
        }return p;
    }
}