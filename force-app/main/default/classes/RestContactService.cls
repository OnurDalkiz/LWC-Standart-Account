@RestResource (UrlMapping='/contactService/')
global class RestContactService {
    
    //wrapper class
    /*global class ContactInsertRequest{
        public String firstName;
        public String lastName;
       	public String email;
        public String phone;
    }*/
    
    @HttpGet
    global static Contact getContactService(){
        RestRequest request = RestContext.request;
        String contactId = request.params.get('contactId');
        Contact con = [SELECT Id, FirstName, lastName ,email ,phone FROM Contact WHERE Id = :contactId LIMIT 1];
        return con;
    }
    
    @HttpPost
    global static Contact postContactService(Contact request){
        Contact con = new Contact();
		con.firstName = request.firstName;
        con.lastName = request.lastName;
        con.email = request.email;
        con.phone = request.phone;
		insert con;

		return con;        
    }

}