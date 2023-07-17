trigger ContentDocumentTrigger on ContentDocument (before delete) {
    if(trigger.isBefore && trigger.isDelete){
        System.debug('Inside before delete');
        Set<String> productCodes = new Set<String>();
        for(ContentDocument cv : trigger.old){
            System.debug('Code to Change ::: '+cv.Title);
            productCodes.add(cv.Title);
        }
        list<Product2> productsToUpdate = new List<Product2>();
        for(Product2 product :[SELECT Id,Name,ProductCode,ContentDocId__c FROM Product2 where ProductCode IN :productCodes]){
            product.ContentDocId__c='';
            System.debug('Product Updated ::: '+product.Name);
            productsToUpdate.add(product);
        }
        update productsToUpdate;
    }
}