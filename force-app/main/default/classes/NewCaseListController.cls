public class NewCaseListController {
    
    
    public List<Case> getNewCases(){
        
        List<Case> result = [ SELECT ID, CaseNumber FROM Case WHERE Status='New'];
        
        return result;
        
    }

}