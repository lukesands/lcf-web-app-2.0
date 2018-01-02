public class Template {

	public String id;
	public String target_object;
	public List<Pages> pages;

	public class Pages {
		public Integer id;
		public String title {get;set;}
		public List<Questions> questions {get;set;}
		public List<Routes> routes;
		public String target_relationship {get;set;}
		public String target_field {get;set;}
		public String target_form {get;set;}
	}

	public class Constraints {
		public String field;
		public String operator;
		public String value;
	}

	public class Questions {

		public String target_field {get;set;}
		public String label {get;set;}
		public String type {get;set;}
		public List<selectOption> values {get;set;}
	}

	public class Routes {
		public Integer target_page;
		public List<Constraints> constraints;
	}

	public Pages getPage(Integer pageId) {
		for (Pages page : this.pages) {
			if (page.id == pageId) {
				return page;
			}
		}
		return null;
	}

	public static Template load(String identifier) {
		String templateUrl = PageReference.forResource(identifier).getUrl();
        PageReference templateReference = new PageReference(templateUrl);
    	String templateJson = templateReference.getContent().toString();
        return Template.parse(templateJson);
	}
	
	public static Template parse(String json) {
		return (Template) System.JSON.deserialize(json, Template.class);
	}
}