@isTest
public with sharing class AccountProcessorTest {
    @isTest
    public static void testAccountProcessor(){
        Account a1 = new Account();
        a1.Name = 'Pied Piper';
        Insert a1;

        Contact cont = New Contact();
        cont.FirstName ='Richard';
        cont.LastName ='Hendricks';
        cont.AccountId = a1.Id;
        Insert cont;
        
        Account a2 = new Account();
        a2.Name = 'Hooli';
        Insert a2;
        
        Contact cont2 = New Contact();
        cont2.FirstName ='Gavin';
        cont2.LastName ='Belson';
        cont2.AccountId = a2.Id;
        Insert cont2;
        
        List<Id> setAccId = new List<ID>();
        setAccId.add(a1.id);
 		setAccid.add(a2.id);
        
        Test.startTest();
        AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account ACC = [select Number_of_Contacts__c from Account where id =: a1.id LIMIT 1];
        System.assertEquals ( Integer.valueOf(ACC.Number_of_Contacts__c) ,1);
  }
}