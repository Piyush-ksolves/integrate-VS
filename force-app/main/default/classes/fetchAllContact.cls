public class fetchAllContact {
	@AuraEnabled
    public static List<Contact> getContacts(Id accountId){
        System.debug('Inside fetchAll Contact');
        List<Contact> contacts = new List<Contact>([Select Id, firstName, LastName, Email, Phone from Contact Where Email != null AND AccountId =:accountId]);
        return contacts;
    }
}