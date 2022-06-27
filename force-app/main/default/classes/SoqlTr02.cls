public class SoqlTr02 {
    
    //Account Objectlerinin Minimum, Maximum ve ortalama Isci
    //sayilarini veren method olusturunuz
    
    //1.Way:
    
    public static void method01(){
        
        AggregateResult[] result =[SELECT MIN(NumberOfEmployees), MAX(NumberOfEmployees), AVG(NumberOfEmployees) FROM Account];
        
        system.debug(result);//Tum Datayi Ayni Satirda Yazdirir.
        
        system.debug('Minumum Number Of Employees =' + result[0].get('expr0'));//DEBUG|Minumum Number Of Employees =0
        system.debug('Maximum Number Of Employees =' + result[0].get('expr1'));//|DEBUG|Maximum Number Of Employees =145000
        system.debug('Average Number Of Employees =' + result[0].get('expr2'));//|DEBUG|Average Number Of Employees =20163.75
    //Record'daki her bir data'yi ayri ayri alabiliriz.
    }
    
    //2.Way:
    
    public static void method02(){
        
        //Alias ==> Takma Isim
        
        AggregateResult[] result =[SELECT MIN(NumberOfEmployees) min, MAX(NumberOfEmployees) max, AVG(NumberOfEmployees) avg FROM Account];
        
        system.debug(result);//|DEBUG|(AggregateResult:{min=0, max=145000, avg=20163.75})
        
       system.debug('Minumum Number Of Employees =' + result[0].get('min'));//DEBUG|Minumum Number Of Employees =0
       system.debug('Maximum Number Of Employees =' + result[0].get('max'));//|DEBUG|Maximum Number Of Employees =145000
       system.debug('Average Number Of Employees =' + result[0].get('avg'));//|DEBUG|Average Number Of Employees =20163.75
    //Record'daki her bir data'yi ayri ayri alabiliriz.
    }
    
    //Example 2: Account objectlerinin Average isci sayilarini
	//Industry'lere gore veren method olusturunuz.
	
    //1.Way(Recommended):
	
    public static void method03(){
        
        AggregateResult[] result =[SELECT AVG(NumberOfEmployees) AvgByIndustry, Industry FROM Account GROUP BY Industry];
            
            system.debug(result);//|DEBUG|(AggregateResult:{AvgByIndustry=null, Industry=null}, AggregateResult:{AvgByIndustry=null, Industry=Agriculture}, AggregateResult:{AvgByIndustry=9000.0, Industry=Apparel}, AggregateResult:{AvgByIndustry=265.0, Industry=Biotechnology}, AggregateResult:{AvgByIndustry=2680.0, Industry=Construction}, AggregateResult:{AvgByIndustry=120.0, Industry=Consulting}, AggregateResult:{AvgByIndustry=20000.0, Industry=Education}, AggregateResult:{AvgByIndustry=57333.333333333336, Industry=Energy}, AggregateResu
			
        for(AggregateResult w : result ){
            
            //system.debug(w);
            
			system.debug('Industry :' + w.get('Industry') + ' ===> ' + 'Average Number Of Employess :' + w.get('AvgByIndustry'));            
	            
        }
    }
    
    //2.Way(Not Recommended);
	
    public static void method04(){

        for(AggregateResult w : [SELECT AVG(NumberOfEmployees) AvgByIndustry, Industry FROM Account GROUP BY Industry] ){
            
            //system.debug(w);
            
			system.debug('Industry :' + w.get('Industry') + ' ===> ' + 'Average Number Of Employess :' + w.get('AvgByIndustry'));            
	            
        }
    }
}