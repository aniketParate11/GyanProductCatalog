public with sharing class GYNC_SearchController {
    @AuraEnabled
    public static List <Product2> searchData() {
   List<Product2> prodList = [SELECT Id,Name,ProductCode,GYNF_Availability__c,GYNCF_Price__c,GYNCF_Product_Category__r.Name,GYNCF_Average_Rating__c,GYNCF_Tags__c from Product2 
                              WHERE GYNCF_Product_Category__c != null LIMIT 50000];
    // System.debug(prodList);
//    List<Product2> prodList = [SELECT Id,GYNCF_Product_Category__r.Name,Name FROM product2];
    return prodList;
          
    } 
    @AuraEnabled
    public static List <Product2> priceLowToHigh() {
        List<Product2> retValue = [SELECT Id, Name,ProductCode,GYNF_Availability__c,GYNCF_Price__c,GYNCF_Product_Category__r.name,GYNCF_Average_Rating__c from Product2 ORDER BY GYNCF_Price__c ASC ];
        return retValue;      
    }
    @AuraEnabled
    public static List <Product2> priceHighToLow() {
        List<Product2> retValue = [SELECT Id, Name,ProductCode,GYNF_Availability__c,GYNCF_Price__c,GYNCF_Product_Category__r.name,GYNCF_Average_Rating__c from Product2 ORDER BY GYNCF_Price__c DESC];
        return retValue;      
    }
    @AuraEnabled
    public static List <Product2> popularityLowToHigh() {
        List<Product2> retValue = [SELECT Id, Name,ProductCode,GYNF_Availability__c,GYNCF_Price__c,GYNCF_Product_Category__r.name,GYNCF_Average_Rating__c from Product2 ORDER BY GYNCF_Average_Rating__c ASC];
        return retValue;      
    }
    @AuraEnabled
    public static List <Product2> popularityHighToLow() {
        List<Product2> retValue = [SELECT Id, Name,ProductCode,GYNF_Availability__c,GYNCF_Price__c,GYNCF_Product_Category__r.name,GYNCF_Average_Rating__c from Product2 ORDER BY GYNCF_Average_Rating__c DESC];
        return retValue;      
    }   
    @AuraEnabled
    public static List<Product2> sliderProducts(decimal limitFromSlider){
        Product2 test=[select GYNCF_Price__c from Product2 where GYNCF_Price__c <= :limitfromSlider];
     //  integer value= integer.Parse(limitfromSlider,NumberStyles.Currency);
     //  limitFromSlider= [select GYNCF_Price__c from Product2];
      System.debug(limitFromSlider);
     //  integer test= integer.valueOf(limitFromSlider);
        System.debug(test);
        return [SELECT Id, Name,ProductCode,GYNF_Availability__c,GYNCF_Price__c,GYNCF_Product_Category__r.name,GYNCF_Average_Rating__c from Product2 where GYNCF_Price__c<: limitFromSlider ];
    }

}