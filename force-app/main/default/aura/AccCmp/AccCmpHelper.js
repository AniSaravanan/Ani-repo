({
	getAccData : function(component) {
        var action = component.get("c.getAccountData");
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") {
                var accData = response.getReturnValue();
                component.set("v.accList",accData);
            }
            if(state === "ERROR"){
                //Error related statements
            }
        });
        $A.enqueueAction(action);
		
	},
    getAccData2 : function(component) {
	}
    
})