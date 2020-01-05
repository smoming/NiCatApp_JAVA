package pers.ming.nicat;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class NiCatAppApplication {

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
