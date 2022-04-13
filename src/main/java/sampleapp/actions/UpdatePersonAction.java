package sampleapp.actions;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import sampleapp.db.SampleAppDataManager;
import sampleapp.db.SampleAppDbWorker;
import sampleapp.db.entities.Person;
import org.conical.common.bbl.util.EnumUtil;
import org.conical.common.bbl.web.util.ActionOperation;

public class UpdatePersonAction extends SampleAppAction {

	private static final long serialVersionUID = 20100901L;

	private static final Logger LOG = LogManager.getLogger(UpdatePersonAction.class);
	
	private ActionOperation _operation;
	private Person _person;
	
	@Override
	public String doWork() throws Exception {
		// save or delete person
		LOG.info("Performing operation " + _operation + " on person: " + _person);
		new SampleAppDbWorker() {
			@Override
			public void doDbTasks(SampleAppDataManager dataMgr) {
				String displayName = (StringUtils.isEmpty(_person.getFullName()) ? "'No-name' user" : _person.getFullName());
				switch (_operation) {
				case CREATE:
					dataMgr.saveObject(_person);
					setMessage(ViewPeopleAction.VIEW_PERSON_MSG, displayName + " has been added.");
					break;
				case UPDATE:
					dataMgr.saveObject(_person);
					setMessage(ViewPeopleAction.VIEW_PERSON_MSG, displayName + " has been updated.");
					break;
				case DELETE:
					dataMgr.deleteObject(_person);
					setMessage(ViewPeopleAction.VIEW_PERSON_MSG, displayName + " has been deleted.");
					break;
				}
			}
		}.doWork();
		
		return SUCCESS;
	}

	public void setOperation(String operation) {
		_operation = EnumUtil.getNullSafeEnum(ActionOperation.class, operation);
	}

	public Person getPerson() {
		if (_person == null) {
			_person = new Person();
		}
		return _person;
	}
	
	@Override
	public String getRequestUrl() {
		return "ViewPeople";
	}
}
