public class LeadProcessor implements Database.Batchable<sObject>{
	public Integer recordsProcessed = 0;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT ID,FirstName,LastName FROM LEAD WHERE LEADSOURCE = \'Dreamforce\'');
    }
	public void execute(Database.BatchableContext bc, List<Lead> scope){
        List<Lead> lstLds = new List<Lead>();
        for(Lead lds : scope){
            lds.LastName = 'Cereja';
            lstLds.add(lds);
            recordsProcessed = recordsProcessed + 1;
        }
        update lstLds;
    }
    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
    }
}