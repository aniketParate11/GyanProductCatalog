/* After update Trigger on Position object which fires when Status changes to 'Interview'
* Developer Name: Debraj Mondal
* Created On:05/12/2020
*/ 

trigger GYNT_createInterviewTrigger on GYNCO_Position__c (before insert,after update) {
    
    List<GYNCO_Interview__c> intr=new List<GYNCO_Interview__c>();
    //list<GYNCO_Position__c> positions= new List<GYNCO_Position__c>();
    GYNCO_Salesforce_Event_Meeting_Link__c obj= new GYNCO_Salesforce_Event_Meeting_Link__c();
    obj=[select GYNCF_Use_Direct_Meeting_Invite__c,GYNCF_Use_Salesforce_Event__c from GYNCO_Salesforce_Event_Meeting_Link__c 
         where Name = 'Test' limit 1 ];
    
    if(Trigger.isBefore && Trigger.isInsert){
        // GYNCO_Position__c pos= new GYNCO_Position__c();
        for(GYNCO_Position__c p: Trigger.new)
        {
            p.GYNCF_Use_Salesforce_Event__c= obj.GYNCF_Use_Salesforce_Event__c;
            p.GYNCF_Send_Direct_Meeting_lnvite__c= obj.GYNCF_Use_Direct_Meeting_Invite__c;
            
            // pos= GYNC_meetingClass.tickboxes(obj);
            //positions.add(pos);
        }
    }
    else if(Trigger.isAfter && Trigger.isUpdate){
        List<GYNCO_Position__c> posList = New List<GYNCO_Position__c>();
        for(GYNCO_Position__c p: Trigger.new)
        {
            if(p.GYNCF_status__c == 'Interview')
            {
                posList.add(p);
            }
        }
        if(posList.size()>0)
        {  
          intr=GYNC_createInterview.createNew(posList);
            if(intr.size()>0)
            {
            insert intr;
            }
        }
    }
}