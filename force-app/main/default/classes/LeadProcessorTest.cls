@isTest
private class LeadProcessorTest {
	
	@isTest static void test() {
		List<Lead> leads = new List<Lead>();

		for(Integer i=0; i<200; i++){
			leads.add(new Lead(
				FirstName = 'Bill',
				LastName = 'Lead'+i,
				Company = 'Acme Co'
			));
		}

		insert leads;

		Test.startTest();
			Database.executeBatch(new LeadProcessor());
		Test.stopTest();
	}
	
}