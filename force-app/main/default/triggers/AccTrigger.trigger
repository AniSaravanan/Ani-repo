trigger AccTrigger on Account (before insert, before update,before delete,after insert,after update) {
    if(trigger.isbefore){
        if(trigger.isInsert || trigger.isUpdate){
       for(Account a:trigger.new){ // List of  all the Account Record that are going to be Inserted
           if(trigger.isInsert||(trigger.isUpdate && a.Rating!=trigger.oldMap.get(a.id).Rating)){  
           if(a.Rating=='cold'){
                 a.BillingCountry='UAE';
              }else if(a.Rating=='Warm'){
                     a.BillingCountry='Canada';
              }else if(a.Rating=='Hot'){
                     a.BillingCountry='India';
              }else {
                  a.BillingCountry='USA';
                        }
                    }
                
       }if(trigger.isDelete){
           // trigger .new is not available in before delete operations
           for(Account accold:trigger.old){
               if(accold.Active__c=='yes')
                   accold.addError('You can not Delete An Active Account');
           }
           
       }
    }   
        
        
        if(trigger.isUpdate){
        for(Account a:trigger.new){
          if(a.BillingCity!=trigger.oldMap.get(a.id).BillingCity||//oldMap-id,record with old value(compare new value with old )
            a.BillingCountry!=trigger.oldMap.get(a.id).BillingCountry||
            a.BillingPostalCode!=trigger.oldMap.get(a.id).BillingPostalcode||
            a.BillingState!=trigger.oldMap.get(a.id).BillingState||
             a.BillingStreet!=trigger.oldMap.get(a.id).BillingStreet){
                 a.ShippingCity=a.BillingCity;
                 a.ShippingCountry=a.BillingCountry;
                 a.ShippingPostalCode=a.BillingPostalCode;
                 a.ShippingState=a.BillingState;
                 a.ShippingStreet=a.BillingStreet;
             }
             }  
        }


    if(trigger.isAfter) {   
    if(trigger.isInsert){
        List<Contact>lstConToInsert=new List<Contact>();// new list of contacts
        for(Account a:trigger.new){//for buikification(taking each record and doing insert)
            Contact c=new Contact();//creating new contact instance
            c.LastName=a.Name;            
            c.MailingCity=a.BillingCity;
            c.MailingCountry=a.BillingCountry;
            c.MailingPostalCode=a.BillingPostalCode;
            c.MailingState=a.BillingState;
            c.MailingStreet=a.BillingStreet;
            c.AccountId=a.Id;
            lstConToInsert.add(c);//Adding the modified contact to the list
            
        }if(!lstConToInsert.isEmpty()){ //to check the size of the contact
          insert lstConToInsert;  
        }
        
    }
    }                       
                      
               if(trigger.isUpdate){
             set<Id> act=new set<Id>();//for bulkification(to get the only records which are modified)
             for(Account a:trigger.new){
               if(a.BillingCity!=trigger.oldMap.get(a.id).BillingCity||
               a.BillingCountry!=trigger.oldMap.get(a.id).BillingCountry||
               a.BillingPostalCode!=trigger.oldMap.get(a.id).BillingPostalcode||
               a.BillingState!=trigger.oldMap.get(a.id).BillingState||
               a.BillingStreet!=trigger.oldMap.get(a.id).BillingStreet){
                   act.add(a.Id);// adding the account Id into the set(which are modified)
               }
                     }
               if(!act.isEmpty()){
                   //To get the fields to be updated
        List<Contact> lstCon=[select id,MailingCountry,MailingState,MailingCity,MailingStreet,MailingPostalcode,Accountid from contact where Accountid=:act];
        List<Contact>lstToUpdate=new List<Contact>();
        for(Contact c:lstCon){
            c.MailingCity=trigger.newMap.get(c.AccountId).BillingCity;
            c.MailingCountry=trigger.newMap.get(c.AccountId).BillingCountry;
            c.MailingPostalCode=trigger.newMap.get(c.AccountId).BillingPostalcode;
            c.MailingState=trigger.newMap.get(c.AccountId).BillingState;
            c.MailingStreet=trigger.newMap.get(c.AccountId).BillingStreet;
            lstToUpdate.add(c);
            
        }if(!lstToUpdate.isEmpty()){//to check whether its having record or not
            update lstToUpdate;
        }
}
                   
               }      

    } if(trigger.isAfter) {
        if(trigger.isUpdate){
            List<Custom_History__c> cusHistoryUpdate =new List<Custom_History__c>();
              for(Account a:trigger.new){
                if(a.BillingCity!=trigger.oldMap.get(a.Id).BillingCity){
                 Custom_History__c h=new Custom_History__c();
                     h.Field_Name__c='Account';
                     h.New_Value__c=a.BillingCity;
                     h.Original_Value__c=trigger.oldMap.get(a.Id).BillingCity;
                      h.Record_Id__c=a.Id;
                      h.Date_Time__c=system.now();
                    	system.debug(h);
                      cusHistoryUpdate.add(h);              
                                    
                }  if(a.BillingCountry!=trigger.oldMap.get(a.Id).BillingCountry){
                 Custom_History__c h=new Custom_History__c();
                     h.Field_Name__c='Account';
                     h.New_Value__c=a.BillingCountry;
                     h.Original_Value__c=trigger.oldMap.get(a.Id).BillingCountry;
                     h.Record_Id__c=a.Id;
                     h.Date_Time__c=system.now();
                    system.debug(h);
                      cusHistoryUpdate.add(h);
                
                }if(a.BillingPostalCode!=trigger.oldMap.get(a.Id).BillingPostalCode){
                 Custom_History__c h=new Custom_History__c();
                     h.Field_Name__c='Account';
                     h.New_Value__c=a.BillingPostalCode;
                     h.Original_Value__c=trigger.oldMap.get(a.Id).BillingPostalCode;
                     h.Record_Id__c=a.Id;
                     h.Date_Time__c=system.now();
                    system.debug(h);
                      cusHistoryUpdate.add(h);
                }if(a.BillingState!=trigger.oldMap.get(a.Id).BillingState){
                 Custom_History__c h=new Custom_History__c();
                     h.Field_Name__c='Account';
                     h.New_Value__c=a.BillingState;
                     h.Original_Value__c=trigger.oldMap.get(a.Id).BillingState;
                     h.Record_Id__c=a.Id;
                     h.Date_Time__c=system.now();
                    system.debug(h);
                      cusHistoryUpdate.add(h);
                }if(a.BillingStreet!=trigger.oldMap.get(a.Id).BillingStreet){
                 Custom_History__c h=new Custom_History__c();
                     h.Field_Name__c='Account';
                     h.New_Value__c=a.BillingStreet;
                     h.Original_Value__c=trigger.oldMap.get(a.Id).BillingStreet;
                     h.Record_Id__c=a.Id;
                     h.Date_Time__c=system.now();
                    system.debug(h);
                      cusHistoryUpdate.add(h);
                    
            
}     
                  system.debug(cusHistoryUpdate);
                  if(!cusHistoryUpdate.isEmpty()){
                     	insert cusHistoryUpdate;
 
                  }
               

            }
        }
}
}