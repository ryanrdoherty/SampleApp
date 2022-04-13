package sampleapp.actions;

import org.conical.common.bbl.web.struts.actions.BaseAction;

public class SampleAppAction extends BaseAction {

	private static final long serialVersionUID = 20100507L;
	
	@Override
	protected boolean actionRequiresLogin() {
		return false;
	}
	
	@Override
	public String doWork() throws Exception {
		// pass through action
		return SUCCESS;
	}
	
	/**
	 * If this app is modified to require login, this method could be
	 * changed to return true only for those with write permission.
	 * 
	 * @return true if user can write, false if read-only
	 */
	public boolean getHasWritePerm() {
		return true;
	}

	protected void setMessage(String messageKey, String message) {
		getSession().put(messageKey, message);
	}
	
	protected String getMessage(String messageKey) {
		String msg = (String)getSession().get(messageKey);
		getSession().remove(messageKey);
		return msg;
	}
	
}
