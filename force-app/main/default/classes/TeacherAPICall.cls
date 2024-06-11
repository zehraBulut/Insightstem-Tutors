public class TeacherAPICall {

    public static void getTeacher(){
        
        HTTP http = new HTTP();
        
        HTTPRequest request = new HTTPRequest();
        request.setEndPoint('https://pathtosalesforce.com/api/JSON/teacher.php');
        request.setMethod('GET');   //data aldgmz ıcın get
        
        HTTPResponse response = http.send(request);
        
      /* system.debug(response.getBody());
       system.debug(response.getStatusCode());
       system.debug(response.getStatus());    */
        
               
      TeacherAPICallResponse res = TeacherAPICallResponse.parse(response.getBody());
       // system.debug(res);
        
        Contact con = new Contact ();
        con.FirstName = res.firstName;
        con.LastName = res.lastName;
        con.Phone = res.phone;
        con.Email = res.email;
        insert con;
        
    }
     
}