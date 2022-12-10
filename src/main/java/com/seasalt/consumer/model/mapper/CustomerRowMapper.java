package com.seasalt.consumer.model.mapper;

import com.seasalt.consumer.model.entity.Customer;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerRowMapper implements RowMapper<Customer> {
    @Override
    public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
        return new Customer(rs.getLong("id"),
                rs.getString("nama"),
                rs.getString("alamat"),
                rs.getString("kota"),
                rs.getString("provinsi"),
                rs.getDate("tgl_registrasi"),
                rs.getBoolean("status"));
    }
}
