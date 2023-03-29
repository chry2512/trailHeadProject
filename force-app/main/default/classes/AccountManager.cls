@RestResource(urlMapping='/Accounts/*/contacts')
global   class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        
        Account result =  [SELECT ID,Name,(SELECT ID, FirstName, LastNAme From Contacts)
                        FROM Account
                        WHERE Id = :accountId];
        return result;
        
}

}