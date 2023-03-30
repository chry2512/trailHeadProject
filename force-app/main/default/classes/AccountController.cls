/**
 * @description       :
 * @author            : Christian Niro
 * @group             :
 * @last modified on  : 03-30-2023
 * @last modified by  : 
 **/
public with sharing class AccountController{
  public static List<Account> getAllActiveAccounts(){
    return [SELECT Id, Name, Active__c
        FROM Account
        WHERE Active__c = 'Yes'];
  }

}