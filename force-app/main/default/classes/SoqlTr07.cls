public class SoqlTr07 {
    
    public static void method01(){
    
    	//Opportunity Object olustunuz.
    	//OLusturdugunuz Opportunity objectini siliniz.
    
    	Opportunity obj = new Opportunity(Name='TechProEd', StageName='Closed Won', CloseDate=Date.today().addDays(2));
    	//obj.Name='TechProEd';
    	//obj.StageName='Closed Won';
    	//obj.CloseDate=Date.today().addDays(-2);
        
    	Database.insert(obj);
        
        //Delete Icin Id'ye Ihtiyac var.
       	
        List<Opportunity> opps = [SELECT Id FROM Opportunity WHERE Name='TechProEd' AND StageName='Closed Won'];
        
        //Database.Delete(opps, false);
        Database.Delete(opps);


    }
}