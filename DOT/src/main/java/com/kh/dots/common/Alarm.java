package com.kh.dots.common;

public class Alarm {
	private String sender;
	private String receiver;
	private String alarm;
	
	public Alarm() {
		
	}

	public Alarm(String sender, String receiver, String alarm) {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.alarm = alarm;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getAlarm() {
		return alarm;
	}

	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}

	@Override
	public String toString() {
		return "Alarm [sender=" + sender + ", receiver=" + receiver + ", alarm=" + alarm + "]";
	}
	
}
