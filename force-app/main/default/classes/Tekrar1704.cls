public class Tekrar1704 {
    
    public static void method01(){
        
        AggregateResult[] result = [SELECT MAX(NumberOfEmployees) Max, MIN(NumberOfEmployees) Min, AVG(NumberOfEmployees) Avg FROM Account];
        
        system.debug(result[0].get('Max'));
        system.debug(result[0].get('Min'));
        system.debug(result[0].get('Avg'));
        
    }
    
    public static void method02(){
        
        AggregateResult[] accs = [SELECT AVG(NumberOfEmployees) AVG, Industry FROM Account GROUP BY Industry];
        
        for(AggregateResult w : accs){
            
            system.debug(w.get('Industry') + '=====' + w.get('AVG'));
            
        }
        
    }
    
    //Account Ismi 'GenePoint', 'Burlington Textiles Corp America', 'sForce', 'Dickenson plc' olan Account'larin 
    //Rating'lerini Account isimleri ile birlikte console yazdiran methodu olusturunuz.
    
    public static void method03(){    
    
        List<Account> result = [SELECT Name, Rating FROM Account WHERE Name IN('GenePoint', 'Burlington Textiles Corp America', 'sForce', 'Dickenson plc')];   
        
        system.debug(result);
        
        for(Account w : result){
            system.debug(w.Name + w.rating);
        }
    }
    
    public static void method04(){
        
        List<String> accountNames = new List<String>{'GenePoint', 'Burlington Textiles Corp of America', 'sForce', 'Dickenson plc'};
            
        List<Account> result1 = [SELECT Name, Rating FROM Account WHERE Name IN :accountNames];
        
        for(Account w : result1){
            system.debug(w.name + w.rating);
        }
        
    }
    
        //Account Ismimlerini Alfabetik siraya koydukdan sonra 3. 4. ve 5. Account'larin 
    //Rating'lerini Account isimleri ile birlikte console yazdiran methodu olusturunuz.

	public static void method05(){
        
        Integer Lim = 3;
        
        Integer Oset = 2;
               
        List<Account> result = [SELECT Name, Rating FROM Account ORDER BY Name LIMIT :Lim OFFSET :Oset];
        
        for(Account w : result){
            
            system.debug(w.name + '-' + w.rating);
        }
    }
    
    	public static void method06(Integer lim, Integer oset){
               
        List<Account> result = [SELECT Name, Rating FROM Account ORDER BY Name LIMIT :Lim OFFSET :Oset];
        
        for(Account w : result){
            
            system.debug(w.name + '-' + w.rating);
        }
    }
    
        	public static void method07(String className){
                
                if(className.equals('Class1')){
                    
                    List<Account> cls1 = [SELECT Name, AnnualRevenue, Rating FROM Account WHERE Rating = 'Hot' AND AnnualRevenue>1000];
                    for(Account w : cls1){
                        system.debug(w.name + w.AnnualRevenue + w.Rating);
                    }
               
                }else if(className.equals('Class2')){
                    
                    List<Account> cls2 = [SELECT Name, AnnualRevenue, Rating FROM Account WHERE Rating = 'Warm' AND AnnualRevenue>1000];
                    for(Account w : cls2){
                        system.debug(w.name + w.AnnualRevenue + w.Rating);
                    }
                    
                }else{
                        List<Account> cls3 = [SELECT Name, AnnualRevenue, Rating FROM Account WHERE Rating = Null];
                        
                    	for(Account w : cls3){
                            
                        system.debug(w.name + w.AnnualRevenue + w.Rating);
                            
                        }
                    }
                }
    public static void method08(String className){
        
        List<Account> q1 = new List<Account>();
        
        if(className.equals('Class1')){
            
            q1 = [SELECT Name, AnnualRevenue, Rating FROM Account WHERE Rating = 'Hot' AND AnnualRevenue>1000];
            
        }else if(className.equals('Class2')){
            
            q1 = [SELECT Name, AnnualRevenue, Rating FROM Account WHERE Rating = 'Warm' AND AnnualRevenue>1000];
            
        }else{
            
            q1 = [SELECT Name, AnnualRevenue, Rating FROM Account WHERE Rating = Null];
            
        }
              for(Account w : q1){
                  system.debug(w.Name + w.AnnualRevenue);
              }
        
        
    }
    
    public static void method09(String className){
        
        String anaQuery = 'SELECT Name, AnnualRevenue, Rating FROM Account';
        
        
        if(className.equals('Class1')){
            
            anaQuery = anaQuery + ' WHERE Rating = \'Hot\' AND AnnualRevenue>1000';
            
        }else if(className.equals('Class2')){
            
            anaQuery = anaQuery + ' WHERE Rating = \'Warm\' AND AnnualRevenue>1000';
            
        }else{
            
            anaQuery = anaQuery + ' WHERE Rating = Null';
            
        }
        
        list<Account> result = database.query(anaQuery);
        
              for(Account w : result){
                  system.debug(w.Name + w.AnnualRevenue);
              }
    }
    
            
	//Bir Account Object Olusturunuz, onu Database'e Insert ediniz.
    //Insert edildigini hem Developer Console'den Hem de UI dan dogrulayiniz.
    
        
    public static void method10(){
        
        Account accs = new Account(Name='Batch76');
        
        accs.rating='Hot';

			insert accs;        
        
    }
    
    
    public static void method11(){
        
        list<Account> accList = new List<Account>();
        
        Account acc1 = new Account(Name='Deneme01');
        Account acc2 = new Account(Name='Deneme02');
        
        accList.add(acc1);
        accList.add(acc2);
        
        insert accList;
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
            }