trigger TestTrigger on Account (before insert, before update) {
    
    if(trigger.isBefore && Trigger.isInsert){
       // TestTriggerHandler.updateAccountRecordData(Trigger.New);
    }
    if(trigger.isBefore && Trigger.isUpdate){
       // TestUpdateContactRecord.newData(Trigger.New);
    }
}