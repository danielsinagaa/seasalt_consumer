package com.seasalt.consumer.controller;

import com.seasalt.consumer.model.entity.Customer;
import com.seasalt.consumer.model.request.EditCustomerRequest;
import com.seasalt.consumer.model.request.NewCustomerRequest;
import com.seasalt.consumer.model.response.CustomerResponse;
import com.seasalt.consumer.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static com.seasalt.consumer.util.Provinsi.getProvinsi;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService service;

    public CustomerController(CustomerService service) {
        this.service = service;
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test(Model model){
        initHome(model);
        return "test";
    }

    @GetMapping
    public String home(Model model){
        initHome(model);
        return "home";
    }

    @GetMapping("/add")
    public String add(Model model){
        init(model);
        model.addAttribute("customer", new NewCustomerRequest());
        return "add";
    }

    @GetMapping("/search")
    public String search(Model model){
        initHome(model);
        model.addAttribute("customer", new NewCustomerRequest());
        return "search";
    }

    @PostMapping("/search")
    public String searchPost(@ModelAttribute("customer") NewCustomerRequest customer, Model model) throws ParseException, SQLException {
        init(model);
        model.addAttribute("consumerList", service.searchByFilter(customer));
        model.addAttribute("customer", new NewCustomerRequest());
        return "search";
    }

    @PostMapping("/add")
    public String newConsumen(@ModelAttribute("customer") NewCustomerRequest customer, Model model) throws ParseException {
        service.save(customer);
        initHome(model);
        return "home";
    }

    @GetMapping("/home/delete/{id}")
    public String homeDelete(Model model,@PathVariable (value = "id")  Long id){
        service.deleteById(id);
        initHome(model);
        return "home";
    }

    @GetMapping("/search/delete/{id}")
    public String searchDelete(Model model,@PathVariable (value = "id")  Long id){
        service.deleteById(id);
        initHome(model);
        model.addAttribute("customer", new NewCustomerRequest());
        return "search";
    }

    @GetMapping("/edit/{id}")
    public String edit(Model model,@PathVariable (value = "id")  Long id){
        Customer customer = service.findById(id);
        model.addAttribute("customer", customer);
        init(model);
        return "edit";
    }

    @PostMapping("/edit/{id}")
    public String newConsumen(@ModelAttribute("customer") EditCustomerRequest customer, Model model) throws ParseException {
        service.save(customer);
        initHome(model);
        return "home";
    }

    private void initHome(Model model) {
        init(model);
        model.addAttribute("consumerList", service.findAll());
    }

    private static void init(Model model) {
        List<String> provinsi = Arrays.asList(getProvinsi());
        Collections.sort(provinsi);
        model.addAttribute("provinsiList", provinsi);
    }
}
