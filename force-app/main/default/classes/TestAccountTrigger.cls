@isTest
private class TestAccountTrigger {
    
    @isTest
    static void test1(){        
        Account acc = new Account(name='007Bn');
        try{
            insert acc;
        }catch(Exception e){
            system.assert(e.getMessage().contains('TechProEdu is not allowed for Account Creations'), 'Hatali Islem Durumu Gerceklesmedi.');
        }  
    }
    
    @isTest
    static void test2(){
        Account acc = new Account(name='testAcc2');
        Database.insert(acc, false);
        acc = [SELECT Industry FROM Account WHERE Id=:acc.Id];
        system.assertEquals('Agriculture', acc.Industry, 'Hatali Industry Fieldi');
    }
    
    @isTest
    static void testAccAndContactBillingCityField(){
        Account acc = new Account(name='TestAcc123', BillingCity ='New Jersey' );
        insert acc;
        Contact con = new Contact(LastName='TestAccount', AccountId=acc.Id, MailingCity='NY');
        insert con;
        acc.BillingCity='New York';
        
        Test.startTest();
        update acc;
        Test.stopTest();
        
        Contact c = [SELECT MailingCity FROM Contact WHERE id=:con.Id];
        
        system.assertEquals(acc.BillingCity, c.MailingCity);
        system.assertNotEquals('NY' ,c.MailingCity);
    }
}