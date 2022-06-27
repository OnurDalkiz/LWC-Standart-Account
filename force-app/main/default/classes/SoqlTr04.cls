public class SoqlTr04 {
    
    //Farkli durumlara gore degisebilen Query'ler, olusturunuz.
    //Ornegin; "Class1" Icin Account Name ve Annual Revenue yu 
    //Rating'i "Hot" ve Annual Revenue'su 1000 den buyuk olanlar
    //Icin Secsin.
    //
    //Ornegin; "Class2" Icin Account Name ve Annual Revenue yu 
    //Rating'i "Warm" ve Annual Revenue'su 1000 den buyuk olanlar
    //Icin Secsin.
	//Ornegin; "Digerleri" Icin Account Name ve Annual Revenue yu 
    //Rating'i "Null"
    
    //1.Way:
	
    public static void method01(String className){
        
        if(className.equals('Class1')){
        
        List<Account> q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating='HOT' AND AnnualRevenue>1000];
        
        for(Account w : q1){
            system.debug(w.Name + ' - ' + w.AnnualRevenue);
        }
        }else if(className.equals('Class2')){
            List<Account> q2 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating='WARM' AND AnnualRevenue>1000];
        
        for(Account w : q2){
            system.debug(w.Name + ' - ' + w.AnnualRevenue);
        }
        }else{
            List<Account> q3 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating=Null];
            for(Account w : q3){
            system.debug(w.Name + ' - ' + w.AnnualRevenue);
            }
        }
        }
    
     //2.Way:Good
	
    public static void method02(String className){
        
        List<Account> q1 = new List<Account>();
        
        if(className.equals('Class1')){
            
        q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating='HOT' AND AnnualRevenue>1000];
            
        }else if(className.equals('Class2')){
            
        q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating='WARM' AND AnnualRevenue>1000];
            
        }else{
            
        q1 = [SELECT Name, AnnualRevenue FROM Account WHERE Rating=Null];
            
        }
        for(Account w : q1){
            system.debug(w.Name + ' - ' + w.AnnualRevenue);
        }
    }
         //3.BEST WAY:Because We Typed 'Dynamic Query'
	
    public static void method03(String className){
        
        List<Account> q1 = new List<Account>();
        
        String anaQuery = 'SELECT Name, AnnualRevenue FROM Account';
        
        if(className.equals('Class1')){
            
        	anaQuery = anaQuery + ' WHERE Rating=\'HOT\' AND AnnualRevenue>1000';
            
        }else if(className.equals('Class2')){
            
            anaQuery = anaQuery + ' WHERE Rating=\'WARM\' AND AnnualRevenue>1000';
            
        }else{
            
        	anaQuery =anaQuery + ' WHERE Rating=Null';
            
        }
        
        List<Account> result = Database.query(anaQuery);
        
        
        for(Account w : result){
            system.debug(w.Name + ' - ' + w.AnnualRevenue);
        }
    }
}