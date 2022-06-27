public class SoqlRecap1 {
    public static void method01(){
    list<Account> myList = [SELECT Name, Id FROM Account WHERE isDeleted = True AND Name LIKE '%test%' ALL ROWS];
    
    delete myList;

}
}