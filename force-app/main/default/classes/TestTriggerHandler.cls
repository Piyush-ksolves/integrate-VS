public class TestTriggerHandler {
    
    public static void updateAccountRecordData(List<Account> accList){
        for(Account acc : accList){
            acc.Site = 'Website Data';
        }
    }

}