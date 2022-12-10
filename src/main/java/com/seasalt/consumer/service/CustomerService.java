package com.seasalt.consumer.service;

import com.seasalt.consumer.model.entity.Customer;
import com.seasalt.consumer.model.mapper.CustomerRowMapper;
import com.seasalt.consumer.model.request.EditCustomerRequest;
import com.seasalt.consumer.model.request.NewCustomerRequest;
import com.seasalt.consumer.model.response.CustomerResponse;
import com.seasalt.consumer.repository.CustomerRepository;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CustomerService {
    private CustomerRepository repository;
    @Autowired

    private JdbcTemplate jdbcTemplate;

    public CustomerService(CustomerRepository repository, JdbcTemplate jdbcTemplate) {
        this.repository = repository;
        this.jdbcTemplate = jdbcTemplate;
    }

    public void deleteById(Long id){
        repository.deleteById(id);
    }

    public Customer findById(Long id) {
        return repository.findById(id).orElseThrow();
    }

    public void save(EditCustomerRequest request) throws ParseException {
        Customer customer = new Customer();
        customer.setId(request.getId());
        customer.setNama(request.getNama());
        customer.setAlamat(request.getAlamat());
        customer.setKota(request.getKota());
        customer.setProvinsi(request.getProvinsi());
        customer.setTglRegistrasi(new SimpleDateFormat("yyyy-MM-dd").parse(request.getTglRegistrasi()));
        customer.setStatus(request.getStatus().equals("true"));
        repository.save(customer);
    }

    public void save(NewCustomerRequest request) throws ParseException {
        Customer customer = new Customer();
        customer.setNama(request.getNama());
        customer.setAlamat(request.getAlamat());
        customer.setKota(request.getKota());
        customer.setProvinsi(request.getProvinsi());
        customer.setTglRegistrasi(new SimpleDateFormat("yyyy-MM-dd").parse(request.getTglRegistrasi()));
        customer.setStatus(request.getStatus().equals("true"));
        repository.save(customer);
    }

    public List<CustomerResponse> findAll(){
        List<CustomerResponse> responses = new ArrayList<>();
        repository.findAll().forEach(it -> {
            CustomerResponse customer = new CustomerResponse();
            customer.setId(it.getId());
            customer.setNama(it.getNama());
            customer.setAlamat(it.getAlamat());
            customer.setKota(it.getKota());
            customer.setProvinsi(it.getProvinsi());
            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
            customer.setTglRegistrasi(String.valueOf(format.format(it.getTglRegistrasi())));
            customer.setStatus(it.getStatus() ? "AKTIF" : "TIDAK AKTIF");
            responses.add(customer);
        });
        return responses;
    }

    public List<Customer> searchByFilter(NewCustomerRequest customer) throws ParseException, SQLException {
        Connection con = DriverManager.getConnection("jdbc:h2:mem:cunsomer","sa","");
        ResultSet rs = null;

        String selectSQL = "SELECT id, nama, alamat, kota, provinsi, tgl_registrasi, status FROM customer WHERE ";
        int i = 1;

        if (!customer.getNama().isBlank()) {
            selectSQL = selectSQL + "nama LIKE '%" + customer.getNama() + "%' ";
            i += 1;
        }

        if (!customer.getAlamat().isBlank()) {
            String AND = "";
            if (i != 1) {
                AND = " AND ";
                i += 1;
            } else i = 1;

            selectSQL = selectSQL + AND + " alamat LIKE '%" + customer.getKota() + "%' ";

        }

        if (!customer.getKota().isBlank()) {
            String AND = "";
            if (i != 1) {
                AND = " AND ";
                i += 1;
            } else i = 1;

            selectSQL = selectSQL + AND + " kota LIKE '%" + customer.getKota()+ "%' ";

        }

        if (!customer.getProvinsi().isBlank()) {
            String AND = "";
            if (i != 1) {
                AND = " AND ";
                i += 1;
            } else i = 1;

            selectSQL = selectSQL + AND + " provinsi = '" + customer.getProvinsi() + "' ";

        }

        if (!customer.getTglRegistrasi().isBlank()) {
            String AND = "";
            if (i != 1) {
                AND = " AND ";
                i += 1;
            } else i = 1;

            selectSQL = selectSQL + AND + "tgl_registrasi = PARSEDATETIME('" + customer.getTglRegistrasi() + "', yyyy-MM-dd) ";
        }

        if (Strings.isNotBlank(customer.getStatus())) {
            String AND = "";
            if (i != 1) {
                AND = " AND ";
                i = 1;
            } else i = 1;

            selectSQL = selectSQL + AND + "status = " + customer.getStatus();
        }

        rs = con.createStatement().executeQuery(selectSQL);
        List<Customer> customers = new ArrayList<>();
        while (rs.next()){
            customers.add(new Customer(rs.getLong("id"),
                    rs.getString("nama"),
                    rs.getString("alamat"),
                    rs.getString("kota"),
                    rs.getString("provinsi"),
                    rs.getDate("tgl_registrasi"),
                    rs.getBoolean("status")));
        }
        return customers;
    }
}
