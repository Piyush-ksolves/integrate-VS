public class UpdateFIeldHandler {
	
    public static void updateContactRecord(List<Contact> conList){
        List<Contact> updList = new List<Contact>();
        for(Contact con : conList){
            con.Test_Field__c = 'New Data';
            
            //con.Test_Field__c = 12;
            updList.add(con);
        }
        
    }
}