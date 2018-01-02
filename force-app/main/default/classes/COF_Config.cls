/**
 * Represents the config
 */
public class COF_Config {

	public List<COF_Form> forms {get;set;}

	/**
	 * Returns a Form given an identifier
	 */
	public COF_Form getForm(String identifier) {
		for (COF_Form form : this.forms) {
			if (form.id == identifier) {
				return form;
			}
		}
		// Throw exception
		return null;
	}

	/**
	 * Instantiates a new COF_Config object given an identifier
	 */
	public static COF_Config load() {
		// Load JSON representation of form
		String configJsonPath = PageReference.forResource('config').getUrl();
        PageReference configJsonReference = new PageReference(configJsonPath);
    	String configJson = configJsonReference.getContent().toString();
    	// Instantiate form from JSON
    	return (COF_Config) System.JSON.deserialize(configJson, COF_Config.class);
    	// Wrap in try, and throw exception
	}
}