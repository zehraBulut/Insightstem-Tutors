//heroku sıtesınden json--> apex e cevr
//BaseCommanResponse clasında response claslardakı comman class varıableları kuladk buyuzden extends yazdk
/******************************************************************************************************************/

  public class TeacherAPICallResponse extends BaseCommanResponse {
    
	public String title;
	public String SSN;
	public String education;
	public Integer age;
	public Integer yearsExperience;

	
	public static TeacherAPICallResponse parse(String json) {
		return (TeacherAPICallResponse) System.JSON.deserialize(json, TeacherAPICallResponse.class);
	}
}