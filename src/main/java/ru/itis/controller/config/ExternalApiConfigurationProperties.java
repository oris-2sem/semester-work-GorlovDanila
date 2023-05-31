package ru.itis.controller.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("external")
@Setter
@Getter
public class ExternalApiConfigurationProperties {
    private String numberToken;
}
