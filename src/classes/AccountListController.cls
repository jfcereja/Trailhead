public class AccountListController {

  public AccountListController(){}
 
  public static List<Account> getAccounts() {
    List<Account> accounts = [SELECT Id, Name, AccountNumber, Phone, Site, LastModifiedDate FROM Account ORDER BY LastModifiedDate DESC];
    return accounts;
  }
  
  @isTest (SeeAllData=true)
  public static void testAccountListController() { 
   accountListController llc = new AccountListController(); 
    System.assertEquals(true, (AccountListController.getAccounts().size() > 0));
  }

}