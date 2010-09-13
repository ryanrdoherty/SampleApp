package sampleapp;

import edu.upenn.bbl.common.jpa.DbWorker;

public abstract class SampleAppDbWorker extends DbWorker<SampleAppDataManager>{

	@Override
	public SampleAppDataManager getDataManager() {
		return new SampleAppDataManagerImpl();
	}

}
