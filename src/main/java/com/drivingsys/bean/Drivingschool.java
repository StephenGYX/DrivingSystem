package com.drivingsys.bean;


import java.util.List;

public class Drivingschool {

	private long did;
	private String daccount;
	private String dpassword;
	private String dname;
	private String dcontacts;
	private long dtelephone;
	private long dphone;
	private String demail;
	private String dprovince;
	private String dcity;
	private String darea;
	private String daddress;
	private String drecruit;
	private long dprice;
	private String dsynopsis;
	private String daccountstate;
	private String drecruitstate;
	private long denrollnum;
	private long dgraduationnum;
	private long devaluatescore;
	private long rid;
	private String dregtime;
	private String longitude;
	private String latitude;
	private String dshenhestate;
	private String dschoolimage;
	private String studentName;
	private List<Examination> myExaminations;
	private Examination examination;
	private String idnumber;
	private String zigeimage;


	public String getIdnumber()
	{
		return idnumber;
	}

	public void setIdnumber(String idnumber)
	{
		this.idnumber = idnumber;
	}


	public String getZigeimage()
	{
		return zigeimage;
	}

	public void setZigeimage(String zigeimage)
	{
		this.zigeimage = zigeimage;
	}

	public String getStudentName()
	{

		return studentName;
	}

	public Drivingschool(long did, String daccount, String dpassword, String dname, String dcontacts, long dtelephone, long dphone, String demail, String dprovince, String dcity, String darea, String daddress, String drecruit, long dprice, String dsynopsis, String daccountstate, String drecruitstate, long denrollnum, long dgraduationnum, long devaluatescore, long rid, String dregtime, String longitude, String latitude, String dshenhestate, String dschoolimage, String studentName, List<Examination> myExaminations, Examination examination)
	{
		this.did = did;
		this.daccount = daccount;
		this.dpassword = dpassword;
		this.dname = dname;
		this.dcontacts = dcontacts;
		this.dtelephone = dtelephone;
		this.dphone = dphone;
		this.demail = demail;
		this.dprovince = dprovince;
		this.dcity = dcity;
		this.darea = darea;
		this.daddress = daddress;
		this.drecruit = drecruit;
		this.dprice = dprice;
		this.dsynopsis = dsynopsis;
		this.daccountstate = daccountstate;
		this.drecruitstate = drecruitstate;
		this.denrollnum = denrollnum;
		this.dgraduationnum = dgraduationnum;
		this.devaluatescore = devaluatescore;
		this.rid = rid;
		this.dregtime = dregtime;
		this.longitude = longitude;
		this.latitude = latitude;
		this.dshenhestate = dshenhestate;
		this.dschoolimage = dschoolimage;
		this.studentName = studentName;
		this.myExaminations = myExaminations;
		this.examination = examination;
	}

	public String getLongitude()
	{
		return longitude;
	}

	public void setLongitude(String longitude)
	{
		this.longitude = longitude;
	}

	public String getLatitude()
	{
		return latitude;
	}

	public void setLatitude(String latitude)
	{
		this.latitude = latitude;
	}

	public String getDshenhestate()
	{
		return dshenhestate;
	}

	public void setDshenhestate(String dshenhestate)
	{
		this.dshenhestate = dshenhestate;
	}

	public void setStudentName(String studentName)
	{
		this.studentName = studentName;
	}

	public List<Examination> getMyExaminations()
	{
		return myExaminations;
	}

	public Examination getExamination()
	{
		return examination;
	}

	public void setExamination(Examination examination)
	{
		this.examination = examination;
	}

	public void setMyExaminations(List<Examination> myExaminations)
	{
		this.myExaminations = myExaminations;
	}

	public String getDschoolimage()
	{
		return dschoolimage;
	}

	public void setDschoolimage(String dschoolimage)
	{
		this.dschoolimage = dschoolimage;
	}




	public Drivingschool()
	{
	}

	public long getDid() {
		return did;
	}

	public void setDid(long did) {
		this.did = did;
	}


	public String getDaccount() {
		return daccount;
	}

	public void setDaccount(String daccount) {
		this.daccount = daccount;
	}


	public String getDpassword() {
		return dpassword;
	}

	public void setDpassword(String dpassword) {
		this.dpassword = dpassword;
	}


	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}


	public String getDcontacts() {
		return dcontacts;
	}

	public void setDcontacts(String dcontacts) {
		this.dcontacts = dcontacts;
	}


	public long getDtelephone() {
		return dtelephone;
	}

	public void setDtelephone(long dtelephone) {
		this.dtelephone = dtelephone;
	}


	public long getDphone() {
		return dphone;
	}

	public void setDphone(long dphone) {
		this.dphone = dphone;
	}


	public String getDemail() {
		return demail;
	}

	public void setDemail(String demail) {
		this.demail = demail;
	}


	public String getDprovince() {
		return dprovince;
	}

	public void setDprovince(String dprovince) {
		this.dprovince = dprovince;
	}


	public String getDcity() {
		return dcity;
	}

	public void setDcity(String dcity) {
		this.dcity = dcity;
	}


	public String getDarea() {
		return darea;
	}

	public void setDarea(String darea) {
		this.darea = darea;
	}


	public String getDaddress() {
		return daddress;
	}

	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}


	public String getDrecruit() {
		return drecruit;
	}

	public void setDrecruit(String drecruit) {
		this.drecruit = drecruit;
	}


	public long getDprice() {
		return dprice;
	}

	public void setDprice(long dprice) {
		this.dprice = dprice;
	}


	public String getDsynopsis() {
		return dsynopsis;
	}

	public void setDsynopsis(String dsynopsis) {
		this.dsynopsis = dsynopsis;
	}


	public String getDaccountstate() {
		return daccountstate;
	}

	public void setDaccountstate(String daccountstate) {
		this.daccountstate = daccountstate;
	}


	public String getDrecruitstate() {
		return drecruitstate;
	}

	public void setDrecruitstate(String drecruitstate) {
		this.drecruitstate = drecruitstate;
	}


	public long getDenrollnum() {
		return denrollnum;
	}

	public void setDenrollnum(long denrollnum) {
		this.denrollnum = denrollnum;
	}


	public long getDgraduationnum() {
		return dgraduationnum;
	}

	public void setDgraduationnum(long dgraduationnum) {
		this.dgraduationnum = dgraduationnum;
	}


	public long getDevaluatescore() {
		return devaluatescore;
	}

	public void setDevaluatescore(long devaluatescore) {
		this.devaluatescore = devaluatescore;
	}


	public long getRid() {
		return rid;
	}

	public void setRid(long rid) {
		this.rid = rid;
	}


	public String getDregtime() {
		return dregtime;
	}

	public void setDregtime(String dregtime) {
		this.dregtime = dregtime;
	}



	@Override
	public String toString()
	{
		return "{ ID  :"+did+"," +
				"账号 :"+daccount+
				"名字 :"+dname+
				"地区 :"+darea+
				"城市 :"+dcity+
				"邮箱 :"+demail+
				"密码 :"+dpassword+
				"注册时间 :"+dregtime+
				"评价得分 :"+devaluatescore+
				"价格 :"+dprice+
				"电话 :"+dtelephone+


				"}";
	}
}
