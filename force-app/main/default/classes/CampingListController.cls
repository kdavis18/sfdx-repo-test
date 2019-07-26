public with sharing class CampingListController {
	@auraEnabled
    public static List<Camping_Item__c> getItems(){
        return [SELECT Id, Name, Quantity__c, Price__c, Packed__c FROM Camping_Item__c];
    }
    
	@auraEnabled
    public static void saveItem(Camping_Item__c item){
        insert item;
    }
}