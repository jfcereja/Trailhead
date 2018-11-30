public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> lstAcc = [select id,Number_of_Contacts__c , (select id from contacts) from account where id in: accountIds];
        for(Account acc : lstAcc){
           List<Contact> lstCont = acc.contacts;
           acc.Number_of_Contacts__c = lstCont.size();
      }
      update lstAcc;
    }
}