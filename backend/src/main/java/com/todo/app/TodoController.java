package com.todo.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TodoController {

    @GetMapping("/api/tasks")
    public List<String> getTasks() {
        return List.of("Apprendre Docker", "Configurer Spring Boot", "Faire le rapport");
    }

    @GetMapping("/api/health")
    public String health() {
        return "OK";
    }
}
