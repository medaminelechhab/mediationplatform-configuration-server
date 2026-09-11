package com.MyProject.mediationplatform.configurationserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class MediationPlatformConfigurationServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(MediationPlatformConfigurationServerApplication.class, args);
	}

}
