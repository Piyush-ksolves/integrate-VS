public class AccountHandler {
    
    public static Account insertNewAccount(String recData){
        Account acc = new Account();
        acc.Name = recData;
        try{
            insert acc;
            System.debug('Record Inserted');
            return acc;
        }catch(Exception e){
            System.debug('Error mesaage = '+e.getMessage());
            return null;
        }
        
    }
}