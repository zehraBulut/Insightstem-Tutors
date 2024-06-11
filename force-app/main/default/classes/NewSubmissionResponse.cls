public class NewSubmissionResponse { //result
    
  //json ın apexe donusmus hali: hereoku dan aldım
	public Parent parent;

	public class Parent {
		public String guardian;
		public String fatherName;
		public String fatherBirthdate;
		public String fatherPhone;
		public String fatherMobile;
		public String fatherEmail;
		public String fatherGender;
		public String motherName;
		public String motherBirthdate;
		public String motherPhone;
		public String motherMobile;
		public String motherEmail;
		public String motherGender;
		public List<Children> children;
	}

	public class Children {
		public String fullName;
		public String phone;
		public String email;
		public String gender;
		public String gradeLevel;
		public Integer childOrder;
		public String plan;
		public String packagePlan;
		public String additionalSubject;
	}

	
	public static NewSubmissionResponse parse(String json) {
		return (NewSubmissionResponse) System.JSON.deserialize(json, NewSubmissionResponse.class);
	}
}