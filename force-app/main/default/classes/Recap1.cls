public class Recap1 {
    
    //Return methoduyla Account'dan veri cekme.
    public static list<Account> method03(String accName){
    
    list<Account> acc = [SELECT Name FROM Account WHERE Name LIKE  :'%' + accName + '%'];
    
    return acc;
        
    }
    
    //Insert Account
    
    public static void insertAccount(String accName){
    
    list<Account> acc = [SELECT Id FROM Account WHERE Name LIKE :'%' + accName + '%' ];
        
        delete acc;          
        
    }
}