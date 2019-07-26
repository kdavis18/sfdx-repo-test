@isTest
private class DailyLeadProcessorTest {
    @isTest static  void testGetCallout() {
			List<Lead> leads = new List<Lead> ();

			for(Integer i=0; i<200; i++){
				leads.add(new Lead(
					FirstName = 'Bill',
					LastName = 'Test'+i,
					Company = 'Company '+i
				));
			}

			insert leads;

			Test.startTest();
				System.schedule('Test schedule', '20 30 8 10 2 ?', new DailyLeadProcessor());
			Test.stopTest();
    }  
}