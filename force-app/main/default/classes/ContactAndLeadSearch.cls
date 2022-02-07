public class ContactAndLeadSearch {
    
    public static List<List< SObject>> searchContactsAndLeads(String str){
        return [Find :str IN ALL FIELDS RETURNING Lead(Name), Contact(FirstName, LastName,Department)];
        
        
    }

}