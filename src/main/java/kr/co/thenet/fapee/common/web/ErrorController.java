package kr.co.thenet.fapee.common.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller

public class ErrorController {
    @GetMapping("/error.do")
    public String defaultError() {
        return "error/error";
    }

    @GetMapping("/no-resource")
    public String noResource() {
        return "error/noResource";
    }

    @GetMapping("/server-error")
    public String serverError() {
        return "error/serverError";
    }
}

