public with sharing class callExchange{

    @AuraEnabled
    public static List<Foreign_Exchange_Trades__c>  exchangeObject(){
             
        try {
            return [SELECT Name, Sell_Currency__c, 
            Sell_Amount__c, Rate__c,Buy_Currency__c, Buy_Amount__c, Date_Booked__c FROM Foreign_Exchange_Trades__c  ORDER BY Date_Booked__c DESC];
        } catch( QueryException e ) {
            System.debug( e.getMessage() );
        }
        
        return null; 
    }                         
}


