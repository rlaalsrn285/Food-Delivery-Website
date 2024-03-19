package com.kh.DeliveryPikachu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DeliveryPikachu.dto.MenuDto;
import com.kh.DeliveryPikachu.mapper.MenuMapper;

@Repository
public class MenuDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private MenuMapper menuMapper;

	// 시퀀스생성
	public int getSequence() {
		String sql = "select menu9_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}

	// 등록
	public void insert(MenuDto menuDto) {
		String sql = "insert into menu9(menu_no, store_no, menu_name, menu_price ) values( ?, ?, ?, ?)";

		Object[] data = { menuDto.getMenuNo(), menuDto.getStoreNo(), menuDto.getMenuName(), menuDto.getMenuPrice() };
		jdbcTemplate.update(sql, data);
	}

	// 가게이미지 이미지 연결
	public void connect(int menuNo, int attachNo) {
		String sql = "insert into menu_attach9(menu_no, attach_no) " + "values(?, ?)";
		Object[] data = { menuNo, attachNo };
		jdbcTemplate.update(sql, data);
	}

	public List<MenuDto> selectListAll() {

		String sql = "select * from menu9 order by menu_no asc";
		return jdbcTemplate.query(sql, menuMapper);
	}

	// attachNO찾기
	public int findAttachNo(int menuNo) {

		String sql = "select attach_no from menu_attach9 where menu_no = ?";
		Object[] data = { menuNo };
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}

}
