public class DailyLeadProcessor implements Schedulable{
	public void execute(SchedulableContext ctx) {
        List<Lead> lstLd = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = null limit 200];
		List<Lead> lstLdUpd = new List<Lead>();
        for(Lead ld : lstLd){
            ld.LeadSource = 'Dreamforce';
            lstLdUpd.add(ld);
        }
        update lstLdUpd;
    }
}