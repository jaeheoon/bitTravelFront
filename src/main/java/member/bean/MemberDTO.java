package member.bean;

public class MemberDTO {
	private int memberNo;
	private String name;
	private String id;
	private String pwd;
	private String phone;
	private String address;
	private int admin;
	
	public MemberDTO() {};
	
	public MemberDTO(String name, String id, String pwd, String phone, String address) {
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.phone = phone;
		this.address = address;
	}

	public void clear() {
		this.memberNo = 0;
		this.name = null;
		this.id = null;
		this.pwd = null;
		this.phone = null;
		this.address = null;
		this.admin = 0;
	}
	
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "회원 번호 : " + memberNo + " 이름 : " + name + " 아이디 : " + id + " 비밀번호 : " + pwd + " 핸드폰 : " + phone;
	}
	
	
}
