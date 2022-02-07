public class ContactSearch {
    
    public static List<Contact> searchForContacts(String matchLastName, String matchPostalCode){
        
        return [Select Id, Name from Contact Where (LastName = :matchLastName AND MailingPostalCode = :matchPostalCode)];
    }

}