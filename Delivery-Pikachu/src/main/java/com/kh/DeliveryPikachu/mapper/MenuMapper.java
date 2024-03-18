package com.kh.DeliveryPikachu.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.kh.DeliveryPikachu.dto.MenuDto;

@Service
public class MenuMapper implements RowMapper<MenuDto> {

	@Override
	public MenuDto mapRow(ResultSet rs, int rowNum) throws SQLException {

		MenuDto menuDto = new MenuDto();

		menuDto.setMenuNo(rs.getInt("menu_no"));
		menuDto.setStoreNo(rs.getInt("store_no"));
		menuDto.setMenuName(rs.getString("menu_name"));
		menuDto.setMenuPrice(rs.getInt("menu_price"));

		return menuDto;
	}

}
