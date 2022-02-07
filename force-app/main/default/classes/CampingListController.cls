public with sharing class CampingListController {
    @auraenabled
    public static List<Camping_Item__c> getItems () {
        System.debug('Inside get Items');
        List<Camping_Item__c> CI = [select id, name,price__c,Quantity__c,Packed__c from Camping_Item__c ];
        return CI;
    }
    @auraenabled
    public static Camping_Item__c saveItem (Camping_Item__c item){
        System.debug('Inside saveItem Campaign');
        upsert item;
        return item;
    }
}