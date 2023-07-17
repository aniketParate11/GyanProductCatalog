trigger EmailMSGAcc on EmailMessage (after insert) {
    set<Id> caseIds = new set<Id>();
    map<Id,string> case2CustomValueMap = new map<Id,string>();
    for(EmailMessage message : trigger.new){
        if(message.Incoming == false){
            string myCustomValue;
            //Some sort of logic that gets the value for this
           
            caseIds.add(message.ParentId);
            case2CustomValueMap.put(message.ParentId, myCustomValue);
        }
    }
    list<Case> casesToUpdate = [Select Id, CaseNumber From Case Where Id IN: caseIds];
    for(Case c : casesToUpdate){
      
    }

    update casesToUpdate;
}