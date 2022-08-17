public class JsonUser {
    public static void getAPI(String UserId){
        Http http=new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://jsonplaceholder.typicode.com/users/'+UserId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode()==200){
            JsonUserObject JsonUser = JsonUserObject.parse(response.getBody());
            
			system.debug(JsonUser.name);
            
            /*Contact cont = new Contact();
            cont.lastName = JsonUser.name;
            cont.Email = JsonUser.email;
            insert cont;*/
            
        }
    }
}