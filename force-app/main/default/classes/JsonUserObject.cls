public class JsonUserObject {

	public class Geo {
		public String lat;
		public String lng;
	}

	public class Company {
		public String name;
		public String catchPhrase;
		public String bs;
	}

	public class Address {
		public String street;
		public String suite;
		public String city;
		public String zipcode;
		public Geo geo;
	}

	public Integer id;
	public String name;
	public String username;
	public String email;
	public Address address;
	public String phone;
	public String website;
	public Company company;

	
	public static JsonUserObject parse(String json) {
		return (JsonUserObject) System.JSON.deserialize(json, JsonUserObject.class);
	}
}