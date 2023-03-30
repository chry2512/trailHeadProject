/**
 * @description       :
 * @author            : Christian Niro
 * @group             :
 * @last modified on  : 03-30-2023
 * @last modified by  : 
 **/
public with sharing class ContactController{
    @AuraEnabled(cacheable = true)
    public static List<Contact> getContacts(){


        return [SELECT FirstName, LastName, Email
                FROM Contact
                WITH SECURITY_ENFORCED
                ORDER BY Name];
    }

}