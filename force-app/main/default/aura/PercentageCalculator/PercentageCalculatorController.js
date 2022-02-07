/*({
    doAdd : function(component, event, helper) {
        var frstNum = component.get('v.FirstNumber');
        var secNum = component.get('v.SecondNumber');
          component.set('v.Result',(parseInt(frstNum)+parseInt(secNum)));
     
    },
    doSub : function(component, event, helper) {
        var frstNum = component.get('v.FirstNumber');
        var secNum = component.get('v.SecondNumber');
          component.set('v.Result',(parseInt(frstNum)-parseInt(secNum)));
     
    },
    
    doDiv : function(component, event, helper) {
        var frstNum = component.get('v.FirstNumber');
        var secNum = component.get('v.SecondNumber');
          component.set('v.Result',(parseInt(frstNum)/parseInt(secNum)));
     
        
    },
    
    doMulti : function(component, event, helper) {
        var frstNum = component.get('v.FirstNumber');
        var secNum = component.get('v.SecondNumber');
        //var result = 
       component.set('v.Result',(parseInt(frstNum)*parseInt(secNum)));
        
        /*alert(component.isValid());
        alert(component.getName());
        alert(component.get('v.Whom')); 
        component.set('v.Whom',"data");
        
        alert(component.get('v.Whom')); 
        
    },
    
    doCreateMap: function(component, event, helper){
        var map= [];
        for(var i=0; i<10; i++){
            map.push({key: i, value: 'Test'+i});
        }
        component.set('v.ListMap',map);
    },
    */
/*
({  
    doInit: function(component, event, helper){
        var action = component.get("c.fetchContact");
        //action.setParams({});
        action.setCallback(this, function(response){
            var responseValue = response.getReturnValue();
            console.log('Response = '+responseValue);
        },'SUCCESS');
        $A.enqueueAction(action,false);
    }
    
});*/
({
    doInit : function(component, event, helper){
        var action = component.get('c.getContacts');
        action.setParams({ accountId: component.get('v.recordId'),});
        action.setCallback(this, function(response){
            var responseValue = response.getReturnValue(); 
            component.set('v.contactList', responseValue);	
        });
                      $A.enqueueAction(action,false);
    },
    
    doRedirect: function(component, event, helper){
        var eventSource = event.getSource();
        var id = eventSource.get('v.name');
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({"recordId" : id, "slideDevName" : "detail"});
        navEvt.fire();
    }
});