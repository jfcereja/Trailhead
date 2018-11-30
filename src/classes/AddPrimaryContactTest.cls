@isTest
public class AddPrimaryContactTest {
	@testSetup
    static void setup(){
        List<Account> acc1 = new List<Account>();
        acc1.add(new Account(name='Parent'));
        for (Integer i = 0; i < 50; i++) {
            acc1.add(new Account(
                name='Hooli '+i,BillingState = 'NY'
            ));
        }
        insert acc1;
        List<Account> acc2 = new List<Account>();
        acc2.add(new Account(name='Parent'));
        for (Integer i = 0; i < 50; i++) {
            acc2.add(new Account(
                name='Test Account'+i,BillingState = 'CA'
            ));
        }
        insert acc2;  
    }
    static testMethod void testAddPrimaryContact(){
        Contact cnt = new Contact(FirstName = 'Big',LastName = 'Head');
        insert cnt;
        AddPrimaryContact apc = new AddPrimaryContact(cnt, 'CA');
        Test.startTest();        
        System.enqueueJob(apc);
        Test.stopTest();
        System.assertEquals(50, [select count() from Contact where account.BillingState = 'CA']);
    }
}