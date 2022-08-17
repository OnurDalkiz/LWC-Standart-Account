public class TestingClass {
    
    public static String displaySign(Integer i){
        
        if(i>0){
            system.debug('Positive');
            return 'Positive';
        }else if(i==0){
            system.debug('Neuter');
            return 'Neuter';            
        }else{
            system.debug('Negative');
            return 'Negative';  
        }
        
    }
    
    public static Decimal calculateBMI(Decimal weight, Decimal height){
        
        if(height <= 0 || weight <= 0 ){
            return -1;
        }else{
            Decimal bmi = weight / (height*height);
            return bmi.setScale(2);
        } 
    }
}