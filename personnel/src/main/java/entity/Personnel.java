package entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Personnel {
   private Integer personnel_id;
   private String first_name;
   private String last_name;
   private String nick_name;
   private Integer sex;
   private Date dob;
   private String email;
   private String mobile;
   private String mobile2;
   private String home;
   private String company;
   private String position;
   private String current_salary;
   private String expected_salary;
   private String persent_city;
   private String expected_city;
   private String expected_position;
   private String education;
   private String working_experience;
   private String working_ys;
   private String english;
   private String japanese;
   private String korean;
   private String academic;
   private String english_level;
   private String reminder;
   private String skillset;
   private String industry;
   private String it_service;
   private String develop;
   private String personnel_sql;
   private String oracle_skill;
   private String create_user;
   private Integer resource_id;
   
   
public Integer getPersonnel_id() {
	return personnel_id;
}
public void setPersonnel_id(Integer personnel_id) {
	this.personnel_id = personnel_id;
}
public String getFirst_name() {
	return first_name;
}
public void setFirst_name(String first_name) {
	this.first_name = first_name;
}
public String getLast_name() {
	return last_name;
}
public void setLast_name(String last_name) {
	this.last_name = last_name;
}
public String getNick_name() {
	return nick_name;
}
public void setNick_name(String nick_name) {
	this.nick_name = nick_name;
}
public Integer getSex() {
	return sex;
}
public void setSex(Integer sex) {
	this.sex = sex;
}
@DateTimeFormat(pattern="yyyy年MM月dd日")
public Date getDob() {
	return dob;
}
public void setDob(Date dob) {
	this.dob = dob;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMobile() {
	return mobile;
}
public void setMobile(String mobile) {
	this.mobile = mobile;
}
public String getMobile2() {
	return mobile2;
}
public void setMobile2(String mobile2) {
	this.mobile2 = mobile2;
}
public String getHome() {
	return home;
}
public void setHome(String home) {
	this.home = home;
}
public String getCompany() {
	return company;
}
public void setCompany(String company) {
	this.company = company;
}
public String getPosition() {
	return position;
}
public void setPosition(String position) {
	this.position = position;
}
public String getCurrent_salary() {
	return current_salary;
}
public void setCurrent_salary(String current_salary) {
	this.current_salary = current_salary;
}
public String getExpected_salary() {
	return expected_salary;
}
public void setExpected_salary(String expected_salary) {
	this.expected_salary = expected_salary;
}
public String getPersent_city() {
	return persent_city;
}
public void setPersent_city(String persent_city) {
	this.persent_city = persent_city;
}
public String getExpected_city() {
	return expected_city;
}
public void setExpected_city(String expected_city) {
	this.expected_city = expected_city;
}
public String getExpected_position() {
	return expected_position;
}
public void setExpected_position(String expected_position) {
	this.expected_position = expected_position;
}
public String getEducation() {
	return education;
}
public void setEducation(String education) {
	this.education = education;
}
public String getWorking_experience() {
	return working_experience;
}
public void setWorking_experience(String working_experience) {
	this.working_experience = working_experience;
}
public String getWorking_ys() {
	return working_ys;
}
public void setWorking_ys(String working_ys) {
	this.working_ys = working_ys;
}
public String getEnglish() {
	return english;
}
public void setEnglish(String english) {
	this.english = english;
}
public String getJapanese() {
	return japanese;
}
public void setJapanese(String japanese) {
	this.japanese = japanese;
}
public String getKorean() {
	return korean;
}
public void setKorean(String korean) {
	this.korean = korean;
}
public String getAcademic() {
	return academic;
}
public void setAcademic(String academic) {
	this.academic = academic;
}
public String getEnglish_level() {
	return english_level;
}
public void setEnglish_level(String english_level) {
	this.english_level = english_level;
}
public String getReminder() {
	return reminder;
}
public void setReminder(String reminder) {
	this.reminder = reminder;
}
public String getSkillset() {
	return skillset;
}
public void setSkillset(String skillset) {
	this.skillset = skillset;
}
public String getIndustry() {
	return industry;
}
public void setIndustry(String industry) {
	this.industry = industry;
}
public String getIt_service() {
	return it_service;
}
public void setIt_service(String it_service) {
	this.it_service = it_service;
}
public String getDevelop() {
	return develop;
}
public void setDevelop(String develop) {
	this.develop = develop;
}

public String getPersonnel_sql() {
	return personnel_sql;
}
public void setPersonnel_sql(String personnel_sql) {
	this.personnel_sql = personnel_sql;
}
public String getOracle_skill() {
	return oracle_skill;
}
public void setOracle_skill(String oracle_skill) {
	this.oracle_skill = oracle_skill;
}
public String getCreate_user() {
	return create_user;
}
public void setCreate_user(String create_user) {
	this.create_user = create_user;
}
public Integer getResource_id() {
	return resource_id;
}
public void setResource_id(Integer resource_id) {
	this.resource_id = resource_id;
}
  
   
   
  
   
}
