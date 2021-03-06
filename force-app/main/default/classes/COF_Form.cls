/**
 * Represents a form
 */
public class COF_Form {

	public String id {get;set;}
	public String title {get;set;}
	public String target_object {get;set;}
	public List<COF_Section> sections {get;set;}

	/**
	 * Returns a section given an identifier
	 */
	public COF_Section getSection(String identifier) {
		for (COF_Section section : this.sections) {
			if (section.id == identifier) {
				return section;
			}
		}
		// Throw exception
		return null;
	}
}
