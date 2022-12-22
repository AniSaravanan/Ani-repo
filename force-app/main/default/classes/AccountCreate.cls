public class AccountCreate {
    @AuraEnabled
    public static String createAccount(Account acc){
        String accId ='';
        try{
            if(acc!=null){
                insert acc;
                accId = acc.Id;
            }
        }catch(Exception e){
            accId ='Error';
        }
        return accId;
    }

}