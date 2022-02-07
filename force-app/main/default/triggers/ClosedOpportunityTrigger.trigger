trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> taskList = new List<Task>();
    for(Opportunity opp: [Select Id from Opportunity Where ID IN:Trigger.New and StageName='Closed Won']){
        Task tk = new Task();
        tk.Subject = 'Follow Up Test Task';
        tk.WhatId = opp.Id;
        taskList.add(tk);
    }
    if(taskList != null && taskList.size() > 0){
        insert taskList;
    }
}