public class LeadProcessor implements Database.Batchable<sObject>{

	public Database.QueryLocator start(Database.BatchableContext bc){
		return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
	}

	public void execute(Database.BatchableContext bc, List<sObject> scope){
		List<Lead> leads = new List<Lead> ();
		for(sObject so : scope){
			Lead l = (Lead)so;
			l.LeadSource = 'Dreamforce';

			leads.add(l);
		}

		update leads;
	}

	public void finish(Database.BatchableContext bc){}
}