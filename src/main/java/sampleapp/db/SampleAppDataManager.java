package sampleapp.db;

import java.util.List;

import sampleapp.db.entities.Person;
import org.conical.common.bbl.jpa.DataManager;

public interface SampleAppDataManager extends DataManager {

	public List<Person> getPeople();
}
