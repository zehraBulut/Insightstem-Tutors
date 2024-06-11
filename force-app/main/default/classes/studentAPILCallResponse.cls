//heroku sıtesınden json--> apex e cevr
//BaseCommanResponse clasında response claslardakı coman clas varıableları kuladk buzden extends yazdk
/*************************************************************************************************************/

public class studentAPILCallResponse extends BaseCommanResponse{
	
	    public String grade;
		public String studentID;
		public String parentName;
		public String parentPhone;
		public Integer age;
	   
	
	   public static StudentAPILCallResponse parse(String json) {
		return (StudentAPILCallResponse) System.JSON.deserialize(json, StudentAPILCallResponse.class);
	}
}