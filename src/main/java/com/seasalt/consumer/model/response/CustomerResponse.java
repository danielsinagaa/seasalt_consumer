package com.seasalt.consumer.model.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerResponse {
    private Long id;
    private String nama;
    private String alamat;
    private String kota;
    private String provinsi;
    private String tglRegistrasi;
    private String status;
}
