package com.kh.DeliveryPikachu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.DeliveryPikachu.dto.MemberDto;
import com.kh.DeliveryPikachu.dto.StoreDto;
import com.kh.DeliveryPikachu.mapper.StoreMapper;

@Repository
public class StoreDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private StoreMapper storeMapper;

	// 등록
	public void insert(StoreDto storeDto) {
		String sql = "INSERT INTO store9 ("
				+ "store_no, store_name, store_post, store_address1, store_address2, store_category, "
				+ "store_contact, store_intro, store_dtip, store_minprice, "
				+ "store_open_hour, store_close_hour, store_closed, " + "store_business_number, member_no"
				+ ") VALUES (?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		Object[] data = { storeDto.getStoreNo(),storeDto.getStoreName(), storeDto.getStorePost(), storeDto.getStoreAddress1(),
				storeDto.getStoreAddress2(), storeDto.getStoreCategory(), storeDto.getStoreContact(),
				storeDto.getStoreIntro(), storeDto.getStoreDtip(), storeDto.getStoreMinprice(),
				storeDto.getStoreOpenHour(), storeDto.getStoreCloseHour(), storeDto.getStoreClosed(),
				storeDto.getStoreBusinessNumber(), storeDto.getMemberNo() };
		jdbcTemplate.update(sql, data);

	}

	// 가게이미지 이미지 연결
	public void connect(int storeNo, int attachNo) {
		String sql = "insert into store_attach9(store_no, attach_no) " + "values(?, ?)";
		Object[] data = { storeNo, attachNo };
		jdbcTemplate.update(sql, data);
	}

	public List<StoreDto> selectListAll() {

		String sql = "select * from store9 order by store_no asc";
		return jdbcTemplate.query(sql, storeMapper);
	}

	public StoreDto selectOne(int storeNo) {
		String sql = "select * from store9 where store_no = ?";
		Object[] data = { storeNo };
		List<StoreDto> list = jdbcTemplate.query(sql, storeMapper, data);
		return list.isEmpty() ? null : list.get(0);
	}

	public int findAttachNo(int storeNo) {

		String sql = "select attach_no from store_attach9 where store_no = ?";
		Object[] data = { storeNo };
		return jdbcTemplate.queryForObject(sql, int.class, data);
	}
	
	//시퀀스생성
	public int getSequence() {
		String sql = "select store9_seq.nextval from dual";
		return jdbcTemplate.queryForObject(sql, int.class);
	}
}
