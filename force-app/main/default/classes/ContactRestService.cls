@RestResource (UrlMapping='/contactProvider/')
global class ContactRestService {
    @HttpGet
    global static Contact getContact(){
        RestRequest request = RestContext.request;
        String contactId = request.params.get('contactId');
        Contact con = [SELECT Id, name ,email ,phone FROM Contact WHERE Id = :contactId LIMIT 1];
        return con;
    }
    @HttpPost
    global static Contact postContact(Contact request){
        
        Contact newContact = new Contact();
        
        newContact.firstName = request.firstName;
        newContact.lastName = request.lastName;
        newContact.email = request.email;
        newContact.phone = request.phone;
        
        insert newContact;
        
        return newContact;
      
    }
}