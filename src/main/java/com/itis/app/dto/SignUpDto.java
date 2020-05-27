package com.itis.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignUpDto {
    @NotEmpty(message = "errors.incorrect.email")
    @Email(regexp = "^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", message = "errors.incorrect.email")
    private String email;
    @NotEmpty(message = "errors.incorrect.password")
    @Size(min=8, message = "errors.incorrect.password")
    private String password;
    @NotEmpty(message = "errors.incorrect.username")
    private String username;

}