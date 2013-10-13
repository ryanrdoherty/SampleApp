package sampleapp.db;

import java.util.List;

import sampleapp.db.entities.Person;
import edu.upenn.bbl.common.jpa.DataManager;

public interface SampleAppDataManager extends DataManager {

	public List<Person> getPeople();
}
