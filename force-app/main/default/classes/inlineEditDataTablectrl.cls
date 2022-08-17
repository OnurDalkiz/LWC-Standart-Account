public class inlineEditDataTablectrl {
    @AuraEnabled
    public static List<Opportunity> getOpportunitys(){
        return [SELECT Id, Name, Amount, CloseDate FROM Opportunity];
    }
    @AuraEnabled
    public static boolean updateOppotunitys(List<Opportunity> oppList){
        try {
            update oppList;
            return true;
        } catch(Exception e) {
            return false;
        }
    }
}