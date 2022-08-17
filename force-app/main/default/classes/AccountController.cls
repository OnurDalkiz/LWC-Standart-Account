public with sharing class AccountController {

    //wire decoratirda kullanabilmek icin @AuraEnabled (cacheable=true) kullaniliyor.
    
    /* @AuraEnabled (cacheable=true) */
    public static List<Account> getAccount(String filter){

        String keyString = '%' + filter + '%';

        List<Account> accountList = [SELECT Id, Name, Phone FROM Account WHERE Name LIKE :keyString LIMIT 10];

        return accountList;

    }
}