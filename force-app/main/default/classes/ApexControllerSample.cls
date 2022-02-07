public with sharing class ApexControllerSample {
    @AuraEnabled
    public static List<Contact> getCountries(){
        List<Contact> countries = new List<Contact>();
            countries = [Select Id, firstName, LastName, Email, Phone from Contact limit 10];
        
        return countries;
    }
}