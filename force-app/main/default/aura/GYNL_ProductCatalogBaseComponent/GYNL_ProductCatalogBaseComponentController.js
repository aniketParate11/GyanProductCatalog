({
	myAction : function(component, event, helper) {
		//Added By Spandana for Dynamic Theme 06/04
        var themeaction = component.get('c.getActiveTheme');
        
          themeaction.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var result= response.getReturnValue();
                component.set("v.staticresourceName", response.getReturnValue());
            //    alert('result==='+result);
            }
        });
        $A.enqueueAction(themeaction);
        
        //Ended By Spandana for Dynamic Theme 06/04
	},
    scriptsLoaded: function(component, event, helper) {
       // alert('gyansys theme script loaded');
    },
    clearGrid : function(component, event, helper) {
       component.set("v.AllProducts",null);
    }
})