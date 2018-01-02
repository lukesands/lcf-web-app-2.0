public class SummaryController extends COF_PageController {

	public COF_Form form {get;set;}
    public COF_Section section {get;set;} 

    public SObject application {get;set;} 

    public SummaryController() {
        COF_Config config = COF_Config.load();
        this.form = config.getForm(this.getFormIdentifierParam());
        this.section = form.getSection(this.getSectionIdentifierParam());
        this.application = this.getApplication();



        /*
			pages[]
        	recursive
        		add page
        		next = getnextpage()

				// if shown add field to field list

        	function return Boolean getNextPage(String identifier) 

        */

    }

    public PageReference complete() {

        String completionPath = ApexPages.currentPage().getParameters().get('completion');
        if (completionPath != null) {
            PageReference nextPage = new PageReference(completionPath);
            return nextPage;
        }

    	// update ov_section_status__c

       	PageReference nextPage = Page.Sections;
        nextPage.getParameters().put('form', this.getFormIdentifierParam());
        nextPage.getParameters().put('app', this.getApplicationIdentifierParam());
        return nextPage;
    }

    public PageReference saveExit() {

        String completionPath = ApexPages.currentPage().getParameters().get('completion');
        if (completionPath != null) {
            PageReference nextPage = new PageReference(completionPath);
            return nextPage;
        }

        PageReference nextPage = Page.Sections;
        nextPage.getParameters().put('form', this.getFormIdentifierParam());
        nextPage.getParameters().put('app', this.getApplicationIdentifierParam());
        return nextPage;
    }

}