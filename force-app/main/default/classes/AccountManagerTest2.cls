@isTest
private class AccountManagerTest2 {
    
    @isTest
    static void testGetAccount(){
        Account a = new Account(Name='Test Account');
        insert a;
        
        Contact c = new Contact(AccountId=a.Id, FirstName='Test', LastName='Test');
        insert c;
        
        RestRequest request = new RestRequest();
        request.requestURI='https://yourInstance.my.salesforce.com/services/apexrest/Accounts/'+a.Id+' /contacts';
        request.httpMethod= 'GET';
        RestContext.request = request;
        
        Account myAcct = AccountManager.getAccount();
        System.assert(myAcct != null);
        System.assertEquals('Test Account',myAcct.Name);
        
    }

}