package sampleapp;

import java.util.List;

import sampleapp.entities.Person;
import edu.upenn.bbl.common.jpa.DataManager;

public interface SampleAppDataManager extends DataManager {

	public List<Person> getPeople();
}
