package pers.ming.nicat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class NiCatAppApplication extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(NiCatAppApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(NiCatAppApplication.class, args);
		InitialCompletion();
	}

	private static void InitialCompletion() {
		System.out.println("#####################################");
		System.out.println("##                                 ##");
		System.out.println("##  NICATAPP  SPRING  BOOT  START  ##");
		System.out.println("##                                 ##");
		System.out.println("#####################################");
	}
}
