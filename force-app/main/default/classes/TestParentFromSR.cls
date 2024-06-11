public class TestParentFromSR {
     
   @invocableMethod (Label = 'Test Parent')//flowda goreblrsn bu methodu
    public static void testParent(){
        
     StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'parent'  LIMIT 1];
        
      TestParentFromSRJSON  result = (TestParentFromSRJSON)JSON.deserialize(sr.Body.toString(),TestParentFromSRJSON.class); //clas aynız amanda objecttır/static resource parent olstrdk,ve TestParentFromSRJSON adında clas olstrdk ıcınde jsondakı olstrdklarmz varıable olrk var
       
  // olustrdgumz json formatındakı statıc resourceu(TestParentFromSRJSON clasındakılerı)--> deserialize yaptık ve apex clasındakı objectlerde  eklıyoruz
        Parent__c parent = result.Parent;
        insert parent;
        
        List<Children__c> children = result.Children;
        
        //chıldren ı parenta baglamak ıcın
        for(Children__c child : children){
            child.Parent__c  = parent.Id;
        }
            insert children;
        
       List<Service__c> services = result.Services;
       
        for(Integer i=0; i<services.size(); i++){
            
            Service__c service = services[i];
            service.Parent__c = parent.Id;
            service.Child__c  = children[i].Id;
        }        
             insert services;

    }
}