public class studentAPICall {
    
  //jsondakı studentı getırıcek bumethod
    public static void  getStudent(){
        
        //Dısardan(external) bılgı almak gerektgınde kualnyrz
          HTTP http = new HTTP(); //requestı gondermek ıcın 
        
          HTTPRequest request = new HTTPRequest();   
          request.setEndpoint('https://pathtosalesforce.com/api/JSON/student.php');//Nerden?
          request.setMethod('GET'); //Ne Yapıyoruz?
          
          HTTPResponse response = http.send(request);
        
          //system.debug(response.getBody());
          //system.debug(response.getStatusCode());
          //system.debug(response.getStatus());
          
          studentAPILCallResponse res = studentAPILCallResponse.parse(response.getBody());//bana gelen apex formatındakı clası cagırdım
           system.debug(res);
         
        Contact con = new Contact();
        con.FirstName = res.firstName;
        con.LastName = res.lastName;
        con.Phone = res.phone;
        con.Email = res.email;
          insert con;
   }         
}