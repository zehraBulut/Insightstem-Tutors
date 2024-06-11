public class TestUtility {
    
    //(9) NOT: METHODları kullanmamız ıcın baska methodta,RETURN olmalı void olursa kulanamayız
    public static void TestRecords(string plan){       
        Parent__c   newParent   = NewParent();
        Children__c newChild  = newChild(newParent.Id);
        Service__C  newService= newService(newParent.Id, newChild.Id, plan); //variable kulanmadm drek methodu cagrdm  //planı parametera ekledık
        NewPayment(newParent.Id, newChild.Id,newService.Id);      
    }
    
     //(8)
     public static void NTestRecords(Integer n){  //DML e takılmamasına dıkat et
         for(Integer i = 1; i<=n; i++){
             
         Parent__c newParent   = NewParent();
         Children__c newChild  = newChild(newParent.Id);
         newService(newParent.Id, newChild.Id, 'Yearly');
         }                     
    }
    
   //(1)ne kulanıcaksan neyın donmesnı ıstyrsan return type ı ona gore degstrmelısın
    Public static Parent__c NewParent(){
        
      Parent__c newParent = new Parent__c();       
        newParent.Father_Full_Name__c = 'Richard Girl';
        newParent.Father_Birthdate__c = Date.newInstance(1983,11,12);
        newParent.Father_Phone__c= '05461983125';
        newParent.Father_Email__c   = 'bulutaktar@gmail.com';
        newParent.Father_Mobile__c = '+90546111746';
        newParent.Mother_Full_Name__c= 'Eslem';
        newParent.Mother_Email__c ='zhrblt83@gmail.com';
        newParent.Mother_Phone__c ='44456789043';
        newParent.Active__c = true;
        newParent.Guardian_Name__c='Judie';
        newParent.Guardian_Relationship__c = 'Father';
        newParent.Guardian_Email__c = 'bulutaktar@gmail.com'; 
        newParent.Guardian_Gender__c='Female';       
                       insert newParent;
                       return newParent;       
    }
    
    //(2)METHOD aynı ama parameterlı oldgu ıcın  Farklı method olur...
    Public static void NewParent(string fullName, string Relationship){
        
      Parent__c newParent = new Parent__c();       
        newParent.Father_Full_Name__c = fullName;
        newParent.Father_Birthdate__c = Date.newInstance(1983,11,12);
        newParent.Father_Phone__c= '05461983125';
        newParent.Father_Email__c   = 'bulutaktar@gmail.com';
        newParent.Mother_Full_Name__c= 'Eslem';
        newParent.Mother_Email__c ='zhrblt83@gmail.com';
        newParent.Mother_Phone__c ='44456789043';
        newParent.Active__c = true;
        newParent.Guardian_Name__c='Judie';
        newParent.Guardian_Email__c = 'bulutaktar@gmail.com';
        newParent.Guardian_Relationship__c = Relationship;
        newParent.Guardian_Gender__c='Female';   
                       insert newParent ;
    }  
    
    //(4)generateRandomValueFromList methodunu tum fıeldlerde kullandım
    Public static void GenerateRandomParent(){
        
      Parent__c newParent = new Parent__c();           
        newParent.Father_Full_Name__c = generateRandomValueFromList(new List<string>{'Furkan Emir', 'Ebrar Bulut','Gokhan Bulut','Destina Ozgur'}); //dynamic yaptım random calısması ıcın alttakı methodu kulandm
        newParent.Father_Birthdate__c = Date.newInstance(1983,11,12);
        newParent.Father_Phone__c= generateRandomValueFromList(new List<string>{'111111111', '999999999','7777777777'});
        newParent.Active__c = true;
        newParent.Guardian_Name__c='Judie';
        newParent.Guardian_Relationship__c = generateRandomValueFromList(new List<string>{'Father', 'Mother'});
        newParent.Guardian_Email__c = generateRandomValueFromList(new List<string>{'ozgurdestina@gmail.com', 'bulutaktar@gmail.com'});        
                      insert newParent ;
                      //system.debug(newParent);
    }
    
    //(5) LookUp- parentına baglı child olusur 
    public static Children__c newChild(string ParentId){
        
     Children__c newChild = new Children__c();      //Call: ID ParentId = TestUtility.NewParent(); TestUtility.newChild(ParentId);
        newChild.Active__c = true;
        newChild.Parent__c = ParentId;
        newChild.Name      ='keanu revers';             
                     insert newChild;
                     return newChild;
   }
    //(6)   
    public static Service__c  newService(string ParentId, string ChildId,string plan){
        
        Service__c newService   = new Service__c();    //call:Parent__c newParent =TestUtility.NewParent(); Children__c newChild =TestUtility.newChild(newParent.Id);TestUtility.newService(newParent.Id,newChild.Id);
           newService.Child__c  = ChildId;
           newService.Parent__c = ParentId;
           newService.Subjects__c= 'Math';
           newService.Plan__c   = plan;
                 insert newService;
                 return newService;        
    }
    //(7)      
    public static void NewPayment(string ParentId, string ChildId,string ServiceId){
        
       List<Payment__c> paymentList = new List<Payment__c>();
        
        Service__c selectedService = [SELECT Id,Plan__c FROM Service__c WHERE Id=:ServiceId];
        
         if(selectedService.Plan__c == 'Monthly'){ 
           for(Integer i=1; i<=8;i++){
                
                Payment__c newPayment = new Payment__c ();
                  newPayment.Child__c=ChildId;
                  newPayment.Parent__c=ParentId;
                  newPayment.Service__c= ServiceId;
                         paymentList.add(newPayment);
            }
                 } else if(selectedService.Plan__c == 'Yearly'){                    
                Payment__c newPayment = new Payment__c ();
                  newPayment.Child__c=ChildId;
                  newPayment.Parent__c=ParentId;
                  newPayment.Service__c= ServiceId;
                         paymentList.add(newPayment);
           }
           insert paymentList;
      }
    
    
  
     //(3) RANDOM METHOD (HERYERDE KULANABLRSIN)
   public static string generateRandomValueFromList(List<string> myList){ //Listten otomatık data alıcak ve random yaparak Rastgele eleman cıkması ıcın olustrdk
        
   //List<string> myList = new List<string>{'Furkan Emir', 'Ebrar Bulut','Gokhan Bulut','Destina Ozgur'};//parameter kulandgm ıcın gerek kalmadı // system.debug(myList.get(1)); //Ebrar Bulut
      
     Integer randomIndex = Math.mod(Math.round((Math.random()*100)),myList.size());       
       return myList.get(randomIndex);  //listin indexlerine gore getırır ve 0 ıle 3 arasında secılır
       
      //call w.anymous: TestUtility.generateRandomValueFromList (new List<string>{'xx','yy','zz'});
    // system.debug(Math.random());                  |DEBUG|0.03316428133104854 , (o-1 arası getırır)
    // system.debug(Math.random()*100);              |DEBUG|89.97825080080757, (0 ıle 100 arası getırtır)
    // system.debug(Math.round((Math.random()*100)));|DEBUG|26  (ınteger yapar)
    
       
    }
    
    
    
    
}