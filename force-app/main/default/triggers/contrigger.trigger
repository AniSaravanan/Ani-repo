trigger contrigger on Contact (after insert,after update,after delete,after undelete){
    if(trigger.isafter){
        set<id> accids=new set<id>();
        if(trigger.isdelete){
            for(contact c:trigger.old){
                accids.add(c.AccountId);
            }
        }else {
            for(contact c:trigger.new){
                if(trigger.isInsert||trigger.isUndelete){
                     accids.add(c.AccountId);
            }
                if(trigger.isUpdate){
                    if(c.AccountId!=trigger.oldMap.get(c.id).AccountId){
                        accids.add(c.AccountId);
                        accids.add(trigger.oldMap.get(c.id).AccountId);
                    }
                }
            }
        }
                    if(!accids.isEmpty()){
                        List<Account>lstToUpdate=new List<Account>();
                        List<Account>lstAcc1=[select id,India_Contact__c,(select id from Contacts where mailingCountry='India')from Account where ID=:accids];
                        List<Account>lstAcc2=[select id,USA_Contact__c,(select id from Contacts where mailingCountry='USA')from Account where ID=:accids];
                        List<Account>lstAcc3=[select id,Canada_Contact__c,(select id from Contacts where mailingCountry='Canada')from Account where ID=:accids];
                        
                     for(Account a:lstAcc1){
                         a.India_Contact__c=a.Contacts.size();
                          lstToUpdate.add(a);
                     }
                     for(Account a:lstAcc2){
                          a.USA_Contact__c=a.Contacts.size(); 
                          lstToUpdate.add(a);
                         }
                         for(Account a:lstAcc3){
                           a.Canada_Contact__c=a.Contacts.size();
                              lstToUpdate.add(a);
                         }
                                     
                    if(!lstToUpdate.isEmpty()){
                    update lstToUpdate;
                }
                        }
                    }
                
}