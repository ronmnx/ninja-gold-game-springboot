
package com.ronaldo.ninja_gold_game.controllers;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;

@Controller
class GoldController {

    String goldSession = "totalGold";
    String activitiesSession = "activities";

    @RequestMapping(value = "/gold", method = RequestMethod.GET)
    public String gold(HttpSession session, Model model) {
        if (session.getAttribute(goldSession) == null) {
            session.setAttribute(goldSession, 0);
            session.setAttribute(activitiesSession, new ArrayList<String>());
        }

        int gold = (int) session.getAttribute(goldSession);
        @SuppressWarnings("unchecked")
        ArrayList<String> activities = (ArrayList<String>) session.getAttribute(activitiesSession);

        model.addAttribute("gold", gold);
        model.addAttribute("activities", activities);

        return "gold.jsp";
    }

    @RequestMapping(value = "/gold/{place}", method = RequestMethod.POST)
    public String addGold(@PathVariable String place, HttpSession session, RedirectAttributes redirectAttributes) {
        Random random = new Random();
        int randomGold = 0;
        String message = "";

        int gold = (int) session.getAttribute(goldSession);
        @SuppressWarnings("unchecked")
        ArrayList<String> activities = (ArrayList<String>) session.getAttribute(activitiesSession);
        LocalDateTime dateNow = LocalDateTime.now();
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("MMMM e yyyy h:mm a");
        String formattedDate = dateNow.format(dateFormat);

        switch (place) {
            case "farm":
                randomGold = random.nextInt(10, 21);
                message = "You entered a " + place + " and earned " + randomGold + " gold.";
                break;
            case "cave":
                randomGold = random.nextInt(5, 11);
                message = "You entered a " + place + " and earned " + randomGold + " gold.";
                break;
            case "house":
                randomGold = random.nextInt(2, 6);
                message = "You entered a " + place + " and earned " + randomGold + " gold.";
                break;
            case "casino":
                Boolean isEarn = random.nextBoolean();
                randomGold = random.nextInt(0, 51);
                if (isEarn) {
                    message = "You entered a " + place + " and earned " + randomGold + " gold.";
                    session.setAttribute(goldSession, gold + randomGold);
                } else {
                    message = "You entered a " + place + " and lost " + randomGold + " gold. Ouch";
                    session.setAttribute(goldSession, gold - randomGold);
                }
                activities.add(message + " (" + formattedDate + ")");
                return "redirect:/gold";

            default:
                break;
        }
        activities.add(message + " (" + formattedDate + ")");
        session.setAttribute(goldSession, gold + randomGold);
        return "redirect:/gold";

    }
}