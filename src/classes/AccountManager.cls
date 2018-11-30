@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){
        Map<Id,String> lstAccount = new Map<Id,String>();
        Map<Id,String> lstAccContact = new Map<Id,String>();
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substring(request.requestURI.lastIndexOf('/Accounts/')+10,request.requestURI.lastIndexOf('/'));
        Account result = [SELECT id,name, (SELECT id,name FROM Contacts)
                          FROM Account
                          WHERE Id = :accountId];
        return result;
    }
}