public class RestAnimalsParser {
    
    public List<String> animals;
    
    public static RestAnimalsParser parse(String json) {
        return (RestAnimalsParser) System.JSON.deserialize(json, RestAnimalsParser.class);  
        
    }	
}