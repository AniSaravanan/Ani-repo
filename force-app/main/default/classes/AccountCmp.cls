public class AccountCmp {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        List<Account> lstacc = [select id,name,Phone,Industry,type,site,Rating from Account limit 10];
        return lstacc;
    } 
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContact(){
        List<Contact> lstCon = [select id,name,Phone from Contact ];
        return lstCon;
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> deleteAcc(String accId,String accName){
        delete [select id from Account where id=:accId];
        //List<Account> lstacc = [select id,name,Phone,Industry from Account ];
        //return lstacc;
        return getAccount();
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountBasedOnName(String accName1,String phone){
        system.debug('accName:'+accName1);
        system.debug('phone:'+phone);
        List<Account> lstacc = [select id,name,Phone,Industry,type,site,Rating from account where name=:accName1 and phone =: phone];
        return lstacc;
    }
    @AuraEnabled
    public static ID createAccount(account acc){
        
        insert acc;
        return acc.Id;
    }
    
}