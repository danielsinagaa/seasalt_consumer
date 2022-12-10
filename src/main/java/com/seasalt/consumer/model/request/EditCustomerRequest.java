package com.seasalt.consumer.model.request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EditCustomerRequest {
    private Long id;
    private String nama;
    private String alamat;
    private String kota;
    private String provinsi;
    private String tglRegistrasi;
    private String status;
}
