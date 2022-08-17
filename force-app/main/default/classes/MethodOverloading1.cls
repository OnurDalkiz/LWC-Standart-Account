public class MethodOverloading1 {
    
    public Integer toplamayap(Integer A, Integer B){
        return a+b;
    }
    
    public Integer toplamayap(Integer A, Integer B, Integer C){
        return a+b+c;
    }
	
    public Double toplamayap(Double A, Integer B){
        return a+b;
    }
    
    public Double toplamayap(Integer A, Double B){
        return a+b;
    }
}