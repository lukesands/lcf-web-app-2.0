/**
 * Represents a question set
 */
public class COF_QuestionSet {

	public String id;
	public String target_object;
	public String parent_relationship;
	public List<COF_Page> pages;

	public class COF_Page {
		public String id;
		public String title {get;set;}
		public String guidance {get;set;}
		public List<COF_Question> questions {get;set;}
		public List<COF_Route> routes;
		public COF_Children children {get;set;}
	}

	public class COF_Children {
		public String target_field {get;set;}
		public String target_object {get;set;}
		public String section {get;set;}
	}

	public class COF_Constraint {
		public String field;
		public String operator;
		public String value;
	}

	public class COF_Question {
		public String target_field {get;set;}
		public String guidance {get;set;}
	}

	public class COF_Route {
		public String target_page;
		public List<COF_Constraint> constraints;
	}

	public COF_Page getPage(String pageId) {
		for (COF_Page page : this.pages) {
			if (page.id == pageId) {
				return page;
			}
		}
		return null;
	}

	public static COF_QuestionSet load(String identifier) {
		String questionSetUrl = PageReference.forResource(identifier).getUrl();
        PageReference questionSetReference = new PageReference(questionSetUrl);
    	String questionSetJson = questionSetReference.getContent().toString();
        return (COF_QuestionSet) System.JSON.deserialize(questionSetJson, COF_QuestionSet.class);
	}
	
}