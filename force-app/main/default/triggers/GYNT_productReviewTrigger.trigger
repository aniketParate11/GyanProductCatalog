trigger GYNT_productReviewTrigger on GYNCO_Product_Review__c (after insert, after delete, after undelete, after update){
    
    if(Trigger.isDelete){
       GYNT_productReviewTriggerHandler.calculateOverallRating(Trigger.old);
    }
    else{
        GYNT_productReviewTriggerHandler.calculateOverallRating(Trigger.new);
    }
  
}