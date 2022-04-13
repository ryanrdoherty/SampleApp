package sampleapp.actions;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import sampleapp.db.SampleAppDataManager;
import sampleapp.db.SampleAppDbWorker;
import sampleapp.db.entities.Person;

public class ViewPeopleAction extends SampleAppAction {

	private static final long serialVersionUID = 20100901L;

	public static final Logger LOG = LogManager.getLogger(ViewPeopleAction.class);

	public static final String VIEW_PERSON_MSG = "view.people.message.key";
	
	private List<Person> _people;
	
	@Override
	public String doWork() throws Exception {
		new SampleAppDbWorker() { @Override public void doDbTasks(SampleAppDataManager dataMgr) {
			_people = dataMgr.getPeople();
		}}.doWork();
		
		return SUCCESS;
	}
	
	public List<Person> getPeople() {
		return _people;
	}
	
	public String getMessage() {
		return getMessage(VIEW_PERSON_MSG);
	}
}
