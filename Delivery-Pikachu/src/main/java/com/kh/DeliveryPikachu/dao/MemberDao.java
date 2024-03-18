package com.kh.DeliveryPikachu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DeliveryPikachu.dto.MemberDto;
import com.kh.DeliveryPikachu.mapper.MemberMapper;

@Repository
public class MemberDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private MemberMapper memberMapper;

	// 가입
	public void insert(MemberDto memberDto) {
		String sql = "insert into member9(" + "member_no,member_id, member_pw, member_nick, member_contact, "
				+ "member_email, member_post, member_address1, member_address2,member_grade) "
				+ "values(member9_seq.nextval,?, ?, ?, ?, ?, ?, ?, ?,?)";
		Object[] data = { memberDto.getMemberId(), memberDto.getMemberPw(), memberDto.getMemberNick(),
				memberDto.getMemberContact(), memberDto.getMemberEmail(), memberDto.getMemberPost(),
				memberDto.getMemberAddress1(), memberDto.getMemberAddress2(), memberDto.getMemberGrade() };
		jdbcTemplate.update(sql, data);
	}

	// 프로필 이미지 연결
	public void connect(String memberId, int attachNo) {
		String sql = "insert into member_attach9(member_id, attach_no) " + "values(?, ?)";
		Object[] data = { memberId, attachNo };
		jdbcTemplate.update(sql, data);
	}
	public int findAttachNo(String memberId) {
		String sql = "select attach_no from member_attach9 where member_id = ?";
		Object[] data = {memberId};
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}

	// 상세(조회, Read)
	public MemberDto selectOne(String memberId) {
		String sql = "select * from member9 where member_id = ?";
		Object[] data = { memberId };
		List<MemberDto> list = jdbcTemplate.query(sql, memberMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	

}
