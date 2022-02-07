public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numOfContacts, String contactLastName){
        List<Contact> conList = new List<Contact>();
        for(Integer i=1; i<=numOfContacts; i++){
            Contact con = new Contact();
            con.FirstName = 'Test '+i;
            con.LastName = contactLastName;
            conList.add(con);
        }
        return conList;
    }
}