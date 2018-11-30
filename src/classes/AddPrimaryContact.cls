public class AddPrimaryContact implements Queueable{
	
    private Contact contacts;
    private String stateAbreviation;
    
    public AddPrimaryContact(Contact cts, String stateAbvr){
        this.contacts = cts;
        this.stateAbreviation = stateAbvr;
    }
    
    public void execute(QueueableContext qc){
        List<Account> lstAcc = [select id from Account where BillingState =: stateAbreviation limit 200];
		List<Contact> lstCts = new List<Contact>();
        for(Account acc : lstAcc){
            Contact cnts = contacts.clone();
            cnts.AccountId = acc.id;
            lstCts.add(cnts);
        }
        insert lstCts;
    }
}