public class InstituteManagementHandler {
    
    public string institutesrecordvalue{get;set;}
    public string mntorName{get;set;}
    public Integer numberOfStu{get;set;}
    // public boolean displayPopup {get; set;}
    boolean displayPopup = false;
    
    public boolean getDisplayPopup() {
        return displayPopup;
    }
    
    public void setDisplayPopup(boolean value) {
        this.displayPopup = value;
    }
    
    public List<SelectOption> getAllInstituteRecords(){
        List<SelectOption> instituteData = new List<SelectOption>();
        
        instituteData.add(new selectOption('', '- None -'));
        for(Institute__c insti :[Select Name from Institute__c] ){
            instituteData.add(new selectoption(insti.Id, insti.Name));
        }
        return instituteData;
    }
    
    public List<Mentor__c> getFetchAllMentors(){
        String institueId = this.institutesrecordvalue;
        setDisplayPopup(false);
        if(institueId != null){
            setDisplayPopup(true);
        }
        System.Debug('Display Popup = '+displayPopup);
        System.debug('institueName = '+institueId);
        
        return [Select Id,Name, Designation__c From Mentor__c Where Institute__c =:institueId];         
    }
    
    
    public List<Student__c> getFetchAllStudents(){
        String selectMentor = this.mntorName;
        System.debug('selectMentor ==> '+selectMentor);
        System.debug('Inside fetch Student method ==>'+selectMentor);
        List<Student__c> studData = new List<Student__c>();
        studData = [SELECT Id, Name, City__c, State__c FROM Student__c where mentor__c =: selectMentor];
        System.debug('Student data = '+studData);
        numberOfStu = studData.size()+1;
        return studData;
    }
    
    public pageReference getFetchStudents()
    {	
        getFetchAllStudents();
        return null;       
    }    

    
}