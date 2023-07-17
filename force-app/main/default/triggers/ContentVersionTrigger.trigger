trigger ContentVersionTrigger on ContentVersion (after insert,after update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        Map<String,id> productToImage = new Map<String,id>();
        for(ContentVersion cd : Trigger.new){
            System.debug('Inserted :: '+cd.title);
            System.debug('Content Version Id ::'+cd.id);
            productToImage.put(cd.Title,cd.id);
        }
        List<Product2> ProdList = new List<Product2>();
        ProdList = [SELECT Id,ProductCode,ContentDocId__c FROM Product2 where ProductCode IN :productToImage.keyset()];
        List<Product2> productsToUpdate = new List<Product2>();
        for(Product2 product : prodList){
            System.debug('Image allocated for Product code:'+product.ProductCode);
            product.ContentDocId__c = productToImage.get(product.ProductCode);
            productsToUpdate.add(product);
        }
        update productsToUpdate;
    }
}