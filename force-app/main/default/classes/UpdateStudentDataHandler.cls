public class UpdateStudentDataHandler {
    
    public static void createStudentHistory(Map<Id,Student__c> newStuMap, Map<Id,Student__c> oldStuMap){
        List<String> studentFieldData = new List<String>();
        Map <String, Schema.SObjectField> fieldMap = Schema.getGlobalDescribe().get('Student__c').getDescribe().fields.getMap();
        Map<String, String> preDefinedMap = new Map<String, String>();
        for(Schema.SObjectField sfield : fieldMap.Values()){
            if(sfield.getdescribe().isAccessible() ==  true && sfield.getdescribe().isUpdateable() == true) {
                studentFieldData.add(sfield.getdescribe().getname());
                System.debug('Field Name ===>'+sfield.getdescribe().getname());
            }
        }
        
        List<Student_History__c> stuHistoryRecList = new List<Student_History__c>();
        for(Id stuId : newStuMap.keySet()){
            System.debug('Inside loop for Id: '+stuId);
            
            Student__c stuUpdatedData = newStuMap.get(stuId);
            Student__c stuOldData = oldStuMap.get(stuId);
            
            for(String fldname: studentFieldData){
                System.debug('Inside another for loop');
                if(stuUpdatedData.get(fldname) != stuOldData.get(fldname)){
                    System.debug('new Value == >'+stuUpdatedData.get(fldname));
                    System.debug('old Value ==>'+stuOldData.get(fldname));
                    Student_History__c stuHistry = new Student_History__c();
                    stuHistry.Field_Name__c = fldname;
                    stuHistry.Old_Value__c =(String)stuOldData.get(fldname);
                    stuHistry.New_Value__c = (String)stuUpdatedData.get(fldname);
                    stuHistry.Record_Id__c = stuId;
                    stuHistoryRecList.add(stuHistry);
                    
                }
            }
        }
        
        if(stuHistoryRecList != null && stuHistoryRecList.size() > 0){
            System.debug('stuHistoryRecList size == '+stuHistoryRecList.size());
            System.debug('stuHistoryRecList first data == '+stuHistoryRecList.get(0));
            System.debug('stuHistoryRecList second data == '+stuHistoryRecList.get(0));
            
            insert stuHistoryRecList;
        }
    }
}