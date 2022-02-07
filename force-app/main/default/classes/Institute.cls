public class Institute {
    public string deatils {get;set;}
    public List<Mentor__c> mentorList{get;set;}
    public string options{get;set;}
    
    
    public List<SelectOption> getItems(){
        List<SelectOption> options =new List<SelectOption>();
        options.add(new selectOption('','- None -'));
        for(Institute__c insti :[Select Name from Institute__c] ){
            options.add(new selectoption(insti.Id, insti.Name));
        }
        
        return options;
        
    }
    
    public void m_List(){
        String chooseInstitue = this.deatils;
        if(chooseInstitue !=''){
            mentorList = [Select Id,Name, Designation__c From Mentor__c Where Institute__c =:chooseInstitue];
        }
    }
    
    
    
}