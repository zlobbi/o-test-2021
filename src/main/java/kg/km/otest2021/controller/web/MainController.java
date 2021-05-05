/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.controller.web;

import kg.km.otest2021.entity.user.User;
import kg.km.otest2021.form.event.EventForm;
import kg.km.otest2021.service.event.EventService;
import kg.km.otest2021.service.search.GoogleSearch;
import kg.km.otest2021.util.RedirectUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
public class MainController {

    private final EventService eventService;
    private final GoogleSearch googleSearch;

    @Autowired
    public MainController(
            EventService eventService,
            GoogleSearch googleSearch
    ) {
        this.eventService = eventService;
        this.googleSearch = googleSearch;
    }

    @GetMapping
    public ModelAndView home() {
        return new ModelAndView("/index")
                .addObject("domain", new EventForm());
    }

    @PostMapping
    public ModelAndView postTask(
            @AuthenticationPrincipal User user,
            @Valid @ModelAttribute("domain") EventForm form,
            BindingResult result
    ) {
        if (result.hasErrors())
            return new ModelAndView("index")
                    .addObject("domain", form);

        eventService.create(form, user);
        return new ModelAndView("index")
                .addObject("domain", form);
    }

    @PostMapping("search")
    public ModelAndView search(
            @RequestParam("search") String searchParam,
            RedirectAttributes attributes
    ) {
        googleSearch.sendRequest(searchParam);
        attributes.addFlashAttribute("indev", true);
        return RedirectUtil.redirect("/");
    }
}
