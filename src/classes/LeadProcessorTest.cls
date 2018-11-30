@isTest
public class LeadProcessorTest {
	@testSetup
    static void setup(){
        List<Lead> lds = new List<Lead>();
        for (Integer i=0;i<200;i++) {
            lds.add(new Lead(FirstName='Minion '+i, LastName='Cereja',Company= 'Pied Piper',Status='Open - Not Contacted', LeadSource = 'Dreamforce'));
        }
        insert lds; 
    }
    static testMethod void testLeadProcessor(){
    	Test.startTest();
        LeadProcessor lp = new LeadProcessor();
		Id BatchId = Database.executeBatch(lp);
        Test.stopTest();
        system.assertEquals(200, [select count() from Lead where lastName = 'Cereja']);
    }	
}