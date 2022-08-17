public class AnimalRestCallOut {
    public static void getAnimals(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response=http.send(request);
        if(response.getStatusCode()==200){
            /*Map<String, Object> results = (Map <String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>)results.get('animals');*/
            
            RestAnimalsParser RAP = RestAnimalsParser.parse(response.getBody());
            for(String animal:RAP.animals){
                system.debug(animal);
            }
        }
    }
	public static void postAnimals(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"Gonzales"}');
        HttpResponse response=http.send(request);
        	if(response.getStatusCode()!=201){
                System.debug('The Status code returned was not expected: '+response.getStatusCode()+ ' '+response.getStatus());           		
            }else{
                system.debug(response.getBody());
            }
    }
}