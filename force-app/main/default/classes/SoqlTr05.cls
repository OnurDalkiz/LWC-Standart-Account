public class SoqlTr05 {
    
    //Bir Account Object Olusturunuz, onu Database'e Insert ediniz.
    //Insert edildigini hem Developer Console'den Hem de UI dan dogrulayiniz.
	
    public static void method01(){
     
        
        //Sadece 1 Tane Insert Yaptik.   
        Account acc1 = new Account(Name='Test01', Phone='123');
        acc1.Rating='Hot';
        
        Insert acc1;//Ya Hep Ya Hic....
//Database.Insert(acc1), Database.Insert(acc1, true), Insert acc1;
//Bu fonksiyonlar kismi basariya musaade etmez!!!       
        
        
//Database.Insert(acc1, false);
//Bu da Ayni fonksiyondur
//Kismi basariya musaade eder.
//Tek Farki Calisanlari Insert eder.
//Calismayanlari es gecer ve veriyi Insert eder.
    
        //Coklu Insert Yapalim
    
    List<Account> accList = new List<Account>();
    
    Account acc2 = new Account(Name='Test02');
    Account acc3 = new Account(Name='Test03');
    Account acc4 = new Account(Name='Test04');
    Account acc5 = new Account(Name='Test05');
    
    accList.add(acc2);
    accList.add(acc3);
    accList.add(acc4);
    accList.add(acc5);
    
    Database.insert(accList, true);
    
    }
    
    
}