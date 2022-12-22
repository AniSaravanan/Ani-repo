({
	doClick : function(component, event, helper) {
        alert:(component.isValid());
        alert:(component.getName());
        alert:(component.get('v.welcome'));
        component.set('v.welcome', "All are welcome");
	//2 Parameters for set 
	//key-Attribute
	//value-That we want to be set for the attribute
    }
})