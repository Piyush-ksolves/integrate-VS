trigger UpdateStudentData on Student__c (after Update) {
    if(Trigger.isAfter && Trigger.isUpdate){
       UpdateStudentDataHandler.createStudentHistory(Trigger.NewMap, Trigger.oldMap);
    }
}