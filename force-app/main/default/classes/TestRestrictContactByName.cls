@isTest
public class TestRestrictContactByName {
    
    @isTest static void insertContactTest(){
        List<Contact> listContact= new List<Contact>();
        Contact c1 = new Contact(LastName='Test1' , email='Test1@gmail.com');
        Contact c2 = new Contact(LastName = 'INVALIDNAME',email='invalid@gmail.com');
        listContact.add(c1);
        listContact.add(c2);
        
        Test.startTest();
        try
        {
            insert listContact;
        }
        catch(Exception ee)
        {
        }
    }
    
    @isTest static void updateContactTest(){
        Contact c1 = new Contact(LastName='Test1' , email='Test1@gmail.com');
        insert c1;
        
        Contact c2 = [Select Id, LastName from Contact Where Id = :c1.Id];
        c2.LastName = 'INVALIDNAME';
        Test.startTest();
        try
        {
            update c2;
        }
        catch(Exception ee)
        {
        }
    }
}