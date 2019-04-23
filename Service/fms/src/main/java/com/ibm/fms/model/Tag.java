package com.ibm.fms.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "posts_audit")
public class Tag implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	
	@Column(name = "words_count")
	private int wordsCount;
	
	@Id
	@Column(name="words")
	private String words;
	
	public int getWordsCount() {
		return wordsCount;
	}
	public void setWordsCount(int wordsCount) {
		this.wordsCount = wordsCount;
	}
	public String getWords() {
		return words;
	}
	public void setWords(String words) {
		this.words = words;
	}
	

}
