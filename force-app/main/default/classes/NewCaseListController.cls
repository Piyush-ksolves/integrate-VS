public class NewCaseListController 
{    
    List<Case> results=new List<Case>();
    
    public string casestatusvalue{get;set;}
    public static List<SelectOption> getcasestatusfield() 
    {	
        List<SelectOption> lstData = new List<SelectOption>();
        lstData.add(new selectOption('', '- None -'));
        
        String strObjectName = 'Case';
        String strPicklistField = 'Status';
        Map<String, String> mapPickListValues = new Map<String, String>();
        Schema.SObjectType objSobjectType = Schema.getGlobalDescribe().get(strObjectName);
        Schema.DescribeSObjectResult objDescribeSobject = objSobjectType.getDescribe();
        Map<String, Schema.SObjectField> mapFields = objDescribeSobject.fields.getMap();
        List<Schema.PicklistEntry> lstPickListValues = mapFields.get(strPicklistField).getDescribe().getPickListValues();
        for (Schema.PicklistEntry objPickList : lstPickListValues) {
            lstData.add(new selectoption(objPickList.getValue(), objPickList.getLabel()));
            System.debug('Value = ' +objPickList.getValue() +' , Label = ' +objPickList.getLabel());
        }
        return lstData;
    }
    public List<Case> getNewCases() 
    {	
        String stusData = this.casestatusvalue;
        System.debug('stusData = '+stusData);
        results=[Select ID,CaseNumber from Case where Status=:stusData];
        return results;
    }
}