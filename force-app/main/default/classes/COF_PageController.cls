/**
 * Page controller
 */
public virtual class COF_PageController {

	public virtual SObject getApplication() {
        List<String> fields = new List<String>();
        fields.add('identifier__c');
        fields.add('theme__c');
        return Query.object('Application__c', fields, 'where identifier__c = \'' + this.getApplicationIdentifierParam() + '\'');
	}

	/**
	 * Returns the section identifier parameter
	 */
	public virtual String getApplicationIdentifierParam() {
		return this.getPageParam('app');
	}

	/**
	 * Returns the section identifier parameter
	 */
	public virtual String getRecordIdentifierParam() {
		return this.getPageParam('id');
	}

	/**
	 * Returns the form identifier parameter
	 */
	public virtual String getFormIdentifierParam() {
		return this.getPageParam('form');
	}

	/**
	 * Returns the section identifier parameter
	 */
	public virtual String getSectionIdentifierParam() {
		return this.getPageParam('section');
	}

	/**
	 * Returns the section identifier parameter
	 */
	public virtual String getPageIdentifierParam() {
		return this.getPageParam('page');
	}

	/**
	 * Returns a page URL parameter given an identifier
	 */
	public virtual String getPageParam(String identifier) {
		String param = ApexPages.currentPage().getParameters().get(identifier);
		if (param != null)
			return param;
		//throw exception
		return null;
	}

	// /**
	//  * Determines whether the visitor has successfully logged in
	//  */
	// public Boolean isAuthorisedUser() {
	// 	// redirect to login
	// 	return yes;
	// }
}