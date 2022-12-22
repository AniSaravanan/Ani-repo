({
   createAccRec: function(component, event, helper) {
         var action = component.get("c.createAccount");
         var accRec = component.get("v.acc");
         action.setParams({"acc": accRec});
         action.setCallback(this,function(response){
             var state = response.getState();
         if(state === "SUCCESS"){
             var accData = response.getReturnValue();         
             var toastEvent = $A.get("e.force:showToast");
                  toastEvent.setParams({
                     "title": "Success!",
                      "type": "Success",
                   "message": "The record has been updated successfully."
                });
                 toastEvent.fire();
                 var navEvt = $A.get("e.force:navigateToSObject");
                 navEvt.setParams({
                         "recordId": accData,
                     "slideDevName": "related"
               });
               navEvt.fire();         
        }
              if(state === "ERROR"){
              var toastEvent = $A.get("e.force:showToast");
                  toastEvent.setParams({
                     "title": "Error!",
                      "type": "Error",
                   "message": "You Can't Create the Record."
                });
                 toastEvent.fire();
                  //Error related statements
     }
		
	});
    $A.enqueueAction(action);
}
})