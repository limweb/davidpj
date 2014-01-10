package com.shopsthai.david.hibernate;

// Generated Nov 14, 2013 10:42:18 PM by Hibernate Tools 3.4.0.CR1

/**
 * Userinfo generated by hbm2java
 */
public class Userinfo implements java.io.Serializable {

	private int no;
	private String name;
	private String subject;
	private String content;
	private String ip;

	public Userinfo() {
	}

	public Userinfo(int no) {
		this.no = no;
	}

	public Userinfo(int no, String name, String subject, String content,
			String ip) {
		this.no = no;
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.ip = ip;
	}

	public int getNo() {
		return this.no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return this.subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}