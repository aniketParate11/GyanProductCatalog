({  
    findRecords: function(component,event,helper) {
    
        var data = component.get("v.data");  
        var allData = component.get("v.unfilteredData");  
        var searchKey = component.get("v.searchCriteria");  
        if(data!=undefined || data.size>0){  
            var filtereddata = allData.filter(word => (!searchKey) || word.Name.toLowerCase().indexOf(searchKey.toLowerCase()) > -1);  
            //  console.log('** '+filtereddata);  
        }   
        component.set("v.data", filtereddata);    
        if(searchKey==''){   
            component.set("v.data",component.get("v.unfilteredData"));  
        }
        helper.callEvent(component,event,helper,component.get("v.data"));
        helper.createCategoryList(component,component.get("v.data"));
        console.log("Event Fired");
        
    },
    callEvent : function(component,event,helper,data){
        
        var category= component.get("v.products");
        
            
        var cmpEvent = $A.get("e.c:GYNE_ProductGridInboundEvent");
        cmpEvent.setParams({
            "filteredProducts" : data
        });
        cmpEvent.fire();
            },
    createCategoryList : function(component,listOfProducts){
        var map = new Map();
        try{
            listOfProducts.forEach((e)=>{
            var key = e.GYNCF_Product_Category__r.Name;
            if(map.has(key)){
            var value = parseInt(e.GYNF_Availability__c)+map.get(key);
            map.set(key,value);
        }else{
                               var value = parseInt(e.GYNF_Availability__c);
        map.set(key,value);
        }
});
   }
  catch(e){
                    console.log('Error'+e);
                }
//console.log('Map : '+map);
var categoryList = []
//a:::b
map.forEach((a,b)=>{
    categoryList.push({category:b,count:a});
});
//console.log('Category List : '+categoryList);
//categoryList.forEach((e)=>console.log(e));
component.set("v.categoryList",categoryList);
}
})