public class AssignmentHandler1 {
	
    Public List<Student__c> studentData{get; set;}  //to store list of Student object data/record
    Public String selectedInstitute{get;set;}    //use to store institute name that selected from VF Page
    Public List<Mentor__c> mentorData{get;set;}  //store list of Mentor Object data
    Public string mentorName{get;set;}           // use to store mentor name that selected from VF Page
    public Integer numberOfStudents{get;set;}    // use in rowspan in table VF page
    public boolean sameMentor{get;set;}
    public String lastMentor{get;set;}
    
    public List<SelectOption> getAllInstituteRecords(){
        List<SelectOption> instituteData = new List<SelectOption>();
        
        instituteData.add(new selectOption('', '- None -'));
        for(Institute__c insti :[Select Name from Institute__c] ){
            instituteData.add(new selectoption(insti.Id, insti.Name));
        }
        return instituteData;
    }
    
    public void fetchAllMentor(){
        String institueId = this.selectedInstitute;
        if(institueId !=''){
            mentorData = [Select Id,Name, Designation__c From Mentor__c Where Institute__c =:institueId];
        }
    }
    
    public void getStudentsDetails(){
        String selectMentor = this.mentorName;
        studentData = [SELECT Id, Name, Class__c,City__c, State__c FROM Student__c where mentor__c =: selectMentor];
        numberOfStudents = studentData.size()+1;
        this.sameMentor = false;
        if(this.lastMentor == this.mentorName){
            this.sameMentor = true;
            this.lastMentor='';
        }else{
            this.lastMentor = selectMentor;
        }
        
    }
    
}