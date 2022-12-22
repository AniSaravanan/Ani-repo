({
	   changeFiled:function(component, event, helper) {
         var accName = component.get("v.acc.Name");
         var accPhone = component.get("v.acc.Phone");
         var accFax = component.get("v.acc.Fax");
         var accEmail = component.get("v.acc.Website");      
        if(accName!= null && accPhone!= null && accFax!=nll && accEmail!=null){
           component.set('v.disabled',False) ;
        }  else{
            component.set('v.disabled',True) ;
        }        
              
	},
    createAccRec : function(component, event, helper) {
		helper.createAccRec(component);
	}
})