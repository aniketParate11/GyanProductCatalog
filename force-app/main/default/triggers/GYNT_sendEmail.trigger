trigger GYNT_sendEmail on Event (before insert) {
 List<Id> Ids = New List<Id>(); 
    For(Event Ev :trigger.new)
    {
      Ids.add(Ev.WhatId);
    }
    
    List<GYNCO_Interview__c> Interview = New List<GYNCO_Interview__c>();
    Interview = [Select Id, Name,GYNCF_Position__r.Name,    GYNCF_Interviewer1__r.Name,GYNCF_Interviewer2__r.Name,GYNCF_Interviewer3__r.Name,
                GYNCF_Interviewer4__r.Name,GYNCF_Interviewer5__r.Name,GYNF_Candidate_Resume_Id__c,GYNCF_Interviewer1__c,GYNCF_Interviewer2__c,
                GYNCF_Interviewer3__c,GYNCF_Interviewer4__c,GYNCF_Interviewer5__c,GYNCF_Round1Complete__c,GYNCF_Round2Complete__c,
                GYNCF_Round3Complete__c,GYNCF_Round4Complete__c,GYNCOF_Round5Complete__c,GYNCF_Round1Date__c,GYNCF_Round2Date__c,
                GYNCF_Round3Date__c,GYNCF_Round4Date__c,GYNCF_Round5Date__c,GYNCF_Status__c,GYNCF_Meeting_Link__c, LastModifiedBy.Name,
                GYNCF_Position__r.GYNCF_Recruitment_owner__c,GYNCF_Position__r.GYNCF_Recruitment_owner__r.Name
                From GYNCO_Interview__c
                Where Id IN :Ids];        //Querying the fields to be referenced in the mail template.
    
    GYNC_SendMailWithAttachments.SendMail(Interview); 
    //calling the function which attaches the cv and sends the email to the respective interviewer.
}