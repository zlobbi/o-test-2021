/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.controller.web;

import kg.km.otest2021.form.event.EventForm;
import kg.km.otest2021.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class EventController {

    private final EventService eventService;

    @Autowired
    public EventController(EventService eventService) {
        this.eventService = eventService;
    }

    @GetMapping
    public ModelAndView home() {
        return new ModelAndView("main/index")
                .addObject("domain", new EventForm());
    }

    @PostMapping
    public ModelAndView postTask(@Valid @ModelAttribute("domain") EventForm form, BindingResult result) {
        if (result.hasErrors()) {
        }
        eventService.create(form);
        return new ModelAndView("main/index")
                .addObject("domain", form);
    }
}
