public class L51contactJSON {

    public static void sampleContactfromSRJSON(){
        
        StaticResource sr = [SELECT Id, Body FROM StaticResource WHERE Name = 'sampleContact' ];
        
        L51contactResponse result = (L51contactResponse)JSON.deserialize(sr.Body.toString() , L51contactResponse.class);
        
         Contact myContact = new Contact();
        
        myContact.FirstName = result.contact.fName;
        myContact.LastName = result.contact.lName;
        myContact.Email = result.contact.contactEmail;
        myContact.Phone = result.contact.contactPhone;
        myContact.MobilePhone = result.contact.contactMobile;
        myContact.Title = result.contact.contactTitle;
        myContact.Level__c = result.contact.contactLevel;
        
        L51contactResponse.MailingAddress mailingAddress  = result.contact.MailingAddress; // L51contactResponse clasının maılıngAd fıeldlerını map yapmak ıstyrm
        
        if(mailingAddress != null){
        myContact.MailingStreet = mailingAddress.street;
        myContact.MailingCity = mailingAddress.city;
        myContact.MailingState = mailingAddress.state;
        myContact.MailingPostalCode = mailingAddress.postalCode;    
        myContact.MailingCountry = mailingAddress.country;    
      }    
    
        L51contactResponse.OtherAddress otherAddress = result.contact.OtherAddress;
        
        if(otherAddress != null){        
            myContact.OtherStreet  = otherAddress.street;
            myContact.OtherCity   = otherAddress.city;
            myContact.OtherState = otherAddress.state;
            myContact.OtherPostalCode = otherAddress.postalCode;
            myContact.OtherCountry = otherAddress.country;
        }
      
            insert myContact;
     
     }  
  }