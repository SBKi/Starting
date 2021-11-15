package com.jcpdev.board.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.Getter;
import lombok.ToString;

@MappedSuperclass		//테이블은 생성은 하지않는 부모클래스
@EntityListeners(value= {AuditingEntityListener.class})
@Getter
@ToString
public abstract class BaseEntity {
	
	@CreatedDate		//insert 할 때 날짜 시간
	@Column(name="reg_date",updatable=false)   //updatable=false : update 쿼리에는 컬럼 제외
	private LocalDateTime regDate;
	
	@LastModifiedDate  //insert,update 할 때 날짜 시간
	@Column(name="mod_date")
	private LocalDateTime modDate;
	
	
	
}
/*   JPA는 고유한 메모리 공간(persistance context) 를 이용하여 엔티티 객체를 관리한다.
 *   여기서 관리되는 객체들이 변경되면 결과적으로 데이터베이스에 반영하는 방식이다.
 *   이러한 엔티티 객체에 일어나는 변화를 감시하는 리스너가 있다. 
 *   -> AuditingEntityListener 지정 (audit 감사,감시)
 *   AuditingEntityListener 활성화는 @EnableJpaAuditing 설정(main 메소드 클래스)
 */