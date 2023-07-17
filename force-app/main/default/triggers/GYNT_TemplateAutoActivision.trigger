trigger GYNT_TemplateAutoActivision on GYNCO_Offer_Letter_Template__c (before insert) {
   
            List<GYNCO_Offer_Letter_Template__c> Temps = New List<GYNCO_Offer_Letter_Template__c>();
            Temps = GYNC_TemplateAutoActivision.ActiveFirstTemplate(trigger.new);
          
        
    
  
}