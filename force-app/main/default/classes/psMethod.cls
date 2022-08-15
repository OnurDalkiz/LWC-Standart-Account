public class psMethod {
    @future
    public static void createPS(String psName, String userName){
        permissionSet psId = [SELECT Id FROM permissionSet WHERE Name= :psName];
		User usId = [SELECT Id FROM User WHERE userName= :userName];
		PermissionSetAssignment psa = new PermissionSetAssignment(AssigneeId=usId.Id, PermissionSetId=psId.Id);
		insert psa;
    }    
}