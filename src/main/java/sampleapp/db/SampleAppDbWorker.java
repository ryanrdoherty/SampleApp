package sampleapp.db;

import org.conical.common.bbl.jpa.DbWorker;

public abstract class SampleAppDbWorker extends DbWorker<SampleAppDataManager>{

	@Override
	public SampleAppDataManager getDataManager() {
		return new SampleAppDataManagerImpl();
	}

}
