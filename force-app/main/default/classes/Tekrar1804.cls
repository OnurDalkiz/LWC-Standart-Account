public class Tekrar1804 {
    
    //1)Database'e bir tane Lead Object'i Insert ediniz.
    //2)Insert ettiginiz Lead object'inin LastName ini "Xyz" yapiniz.
    
    public static void method01(){
    Lead newleads = new Lead(Firstname='B76', Lastname='Team2', company='TechPro');
       
    //insert newleads;
        
        list<Lead> result = [SELECT Id, Lastname FROM Lead WHERE Firstname='B76' AND Lastname='Team2' AND company='TechPro'];
        
        for(Lead w : result){
            
            w.lastname ='Xyz';
            
        }
        
        update result;
    }
 
    public static void method02(){
        
        //Opportunity opps = new Opportunity(Name='Test001', stageName='Closed Won', CloseDate=Date.today().addDays(2));
        
        //insert opps;
        
        List<Opportunity> Qopps = [SELECT Id FROM Opportunity WHERE Name='Test001' AND stageName='Closed Won'];
      
        database.delete(Qopps, true);
        
    }
    public static void method03(){
        
        list<Opportunity> Qopps = [SELECT Id FROM Opportunity WHERE isDeleted = true ALL ROWS];
      
        database.undelete(Qopps, false);
        
    }









































































}