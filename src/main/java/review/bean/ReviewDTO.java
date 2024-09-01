package review.bean;

public class ReviewDTO {
	private int reviewNo;
	private String travelName;
	private String continent;
	private String memberId;
	private String subject;
	private String content;
	private String reviewComment;
	private String date;
	private double like;
	private int hit;
	
	public ReviewDTO() {};
	
	public ReviewDTO(int reviewNo, String memberId, String subject, String content, String reviewComment, String date, int hit) {
		this.reviewNo = reviewNo;
		this.memberId = memberId;
		this.subject = subject;
		this.content = content;
		this.reviewComment = reviewComment;
		this.date = date;
		this.hit = hit;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getTravelName() {
		return travelName;
	}

	public void setTravelName(String travelName) {
		this.travelName = travelName;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public double getLike() {
		return like;
	}

	public void setLike(double like) {
		this.like = like;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "리뷰 번호 : " + reviewNo + " 여행지명 : " + travelName + " 대륙 : " + continent + " 작성자 : " + memberId + " 제목 : " + subject + " 내용 : " + content
				+ "평점" + like + " 댓글 : " + reviewComment + " 작성 날짜 : " + date;
	}
}
