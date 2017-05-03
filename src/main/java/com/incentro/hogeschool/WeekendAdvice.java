package com.incentro.hogeschool;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.Calendar;

@ControllerAdvice
public class WeekendAdvice {
    @ModelAttribute("weekendMessage")
    public String weekendMessage() {
        Calendar calendar = Calendar.getInstance();

        switch(calendar.get(Calendar.DAY_OF_WEEK)){
            case Calendar.SUNDAY:
                return "Ahh lekker een rustig dagje.";
            case Calendar.MONDAY:
                return "Helaas het weekend is net voorbij :(";
            case Calendar.TUESDAY:
                return "Pff gelukkig is het geen maandag meer.";
            case Calendar.WEDNESDAY:
                return "Ooh het is al halverwege de werkweek.";
            case Calendar.THURSDAY:
                return "bijna... bijna... bijna...";
            case Calendar.FRIDAY:
                return "Nog één dagje tot WEEKEND!!!";
            case Calendar.SATURDAY:
                return "WEEKEND!!!";
            default:
                return "Dit is een aparte dag :(";
        }
    }
}
