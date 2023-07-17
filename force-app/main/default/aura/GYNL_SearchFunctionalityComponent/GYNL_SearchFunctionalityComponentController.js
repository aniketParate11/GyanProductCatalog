({  
   doInit :function(component,event,helper){ 
     console.log('Calling do init');
     var action = component.get("c.searchData"); 
      // alert(action);
     action.setCallback(this,function(response){   
       var state = response.getState();
       //  alert(state);
       if(state == 'SUCCESS'){  
         //  alert('Yes');
         var result = response.getReturnValue();     
         component.set("v.unfilteredData",result);  
         console.log(result);
         helper.createCategoryList(component,result);
         component.set("v.data",result);  
       }else{  
          // alert("SAD");
         console.log('something bad happend! ');  
       }  
     });  
     $A.enqueueAction(action);  
   }, 
    
    handleRangeChange : function(component, event, helper){
        //console.log("Max : "+component.get("v.maxPrice"));
        //console.log("Min : "+component.get("v.minPrice"));
        //console.log("Value :"+component.get("v.val"));
        console.log("Slider changed");
    },
    
   doFilter: function(component, event, helper) {   
     helper.findRecords(component,event,helper);  
   },
    onChange: function(component, event, helper){
        var action1= component.get("c.priceLowToHigh");
        var action2= component.get("c.priceHighToLow");
        var action3= component.get("c.popularityLowToHigh");
        var action4= component.get("c.popularityHighToLow");
        var value= component.find('select').get('v.value');
        console.log(value);
        if(value=='prl2h'){
           // alert('You chose option 1');
            action1.setCallback(this,function(response){
                var state = response.getState();
                if(state == 'SUCCESS'){
                    var result = response.getReturnValue();
                    var disp= JSON.stringify(result);
                    //alert(disp);
                    helper.callEvent(component,event,helper,result);
                    component.set("v.dataPrLowToHigh",result);
                    console.log("Event Fired from option 1");
                }
            });
            $A.enqueueAction(action1);
        }
         if(value=='prh2l'){
            //alert('You chose option 2');
             action2.setCallback(this,function(response){
                var state = response.getState();
                if(state == 'SUCCESS'){
                    var result = response.getReturnValue();
                    var disp= JSON.stringify(result);
                    //alert(disp);
                    component.set("v.dataPrHighToLow",result);
                    helper.callEvent(component,event,helper,result);
                    console.log("Event Fired from option 2");
                }
            });
            $A.enqueueAction(action2);
        }
         if(value=='pol2h'){
            //alert('You chose option 3');
             action3.setCallback(this,function(response){
                var state = response.getState();
                if(state == 'SUCCESS'){
                    var result = response.getReturnValue();
                    var disp= JSON.stringify(result);
                    //alert(disp);
                    component.set("v.dataPoLowToHigh",disp);
                    helper.callEvent(component,event,helper,result);
                    console.log("Event Fired from option 3");
                }
            });
            $A.enqueueAction(action3);
        }
         if(value=='poh2l'){
           // alert('You chose option 4');
             action4.setCallback(this,function(response){
                var state = response.getState();
                if(state == 'SUCCESS'){
                    var result = response.getReturnValue();
                    var disp= JSON.stringify(result);
                    //alert(result);
                    component.set("v.dataPoHighToLow",result);
                    helper.callEvent(component,event,helper,result);
                    console.log("Event Fired from option 4");
                }
            });
            $A.enqueueAction(action4);
        }
   /*     if(value='one')
            alert('Null Value');*/
    },
      handleRangeChange: function (component, event) {
        var action = component.get("c.sliderProducts");
        action.setParams({limitFromSlider :event.getParam("value") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.products", response.getReturnValue());
                var cmpEvent = $A.get("e.c:GYNE_ProductGridInboundEvent");
                cmpEvent.setParams({
                    "filteredProducts" : response.getReturnValue(),
                    	//parent : 'search'
                });
                cmpEvent.fire();
                
                
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
        console.log(component.get("v.products"));
        
    },
    scriptsLoaded: function(component, event, helper) {
        console.log("gyansys theme script loaded");
    }
 /*   priceSlide: function(component, event,helper){
        alert(component.get("v.value"));
    }*/
    
    
    
    
    
 })