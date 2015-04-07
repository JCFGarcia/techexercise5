package org.techexercise.jc_techexercise_crudsys;

import org.junit.Test;

import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.equalTo;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class OrderFormTest extends WebAppConfigurationAware {
    @Test
    public void displaysOrderForm() throws Exception {
        mockMvc.perform(get("/orders"))
                .andExpect(view().name("orders"))
                .andExpect(content().string(
                        allOf(
                                containsString("<title>Order Records</title>"),
                                containsString("<legend>Create New Order Form</legend>"),
                                containsString("<legend>Edit Order Form</legend>")
                        ))
                );
    }
}