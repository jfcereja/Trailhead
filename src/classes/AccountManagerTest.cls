@IsTest
public class AccountManagerTest {
    @isTest static void testGetAccountById() {
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://jfcereja-dev-ed.my.salesforce.com/services/apexrest/Accounts/'
            + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAccount = AccountManager.getAccount();
        System.assert(thisAccount != null);
        System.assertEquals('Silicon Valley', thisAccount.Name);
    }
    static Id createTestRecord() {
        Account accountTest = new Account(
            Name='Silicon Valley');
        insert accountTest;
        return accountTest.Id;
    }          
}