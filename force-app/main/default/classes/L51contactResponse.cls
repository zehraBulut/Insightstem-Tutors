/*lesson 51 task: statıc resourse json koyduk ordakı contact ve fıeldlerı org ta tanıtıp olustrucaz
L51contactJSON clasında statıc resourse u cagrdk,deserialıze ettk  ve mapp yaptık
******************************************************************************************************/

  public class L51contactResponse {

	public Contact contact;

	public class Contact {
		public String fName;
		public String lName;
		public String contactEmail;
		public String contactPhone;
		public String contactMobile;
		public MailingAddress mailingAddress;
		public OtherAddress otherAddress;
		public String contactTitle;
		public String contactLevel;
	}

	public class MailingAddress  {
		public String street;
		public String city;
		public String state;
		public String postalCode;
		public String country;
	}
    	public class OtherAddress {
		public String street;
		public String city;
		public String state;
		public String postalCode;
		public String country;
	}
  
}