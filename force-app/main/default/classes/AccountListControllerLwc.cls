public class AccountListControllerLwc{
    @AuraEnabled(cacheable = true)
    public static List<Account> queryAccountsByEmployeeNumber(Integer NumberOfEmployees){
        return [SELECT Name
                FROM Account
                WHERE NumberOfEmployees >= :NumberOfEmployees];
    }

    @AuraEnabled(cacheable = true)
    public static List<Account> queryAccountsByRevenue(Decimal annualRevenue){
        return [SELECT Name
                FROM Account
                WHERE AnnualRevenue >= :annualRevenue];
    }

}