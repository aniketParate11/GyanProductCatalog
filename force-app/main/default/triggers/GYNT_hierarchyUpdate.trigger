trigger GYNT_hierarchyUpdate on GYNCO_Product_Category__c(after insert,after update){
    if(GYNC_hierarchyUpdateHandler.preventRecurrsion==false){
        GYNC_hierarchyUpdateHandler.updateHierarchyOnInsertUpdate(Trigger.New);
    }
}