/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.util;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimeHelper {

    public static final String DATE_TIME_FORMAT = "dd.MM.yyyy HH:mm";
    public static final String TIME_FORMAT = "HH:mm";
    public static final String DATE_TIME_SS_FORMAT = "dd.MM.yyyy HH:mm:ss";
    public static final String DATE_FORMAT = "dd.MM.yyyy";
    public static final String DATE_REVERSE_FORMAT = "yyyy-MM-dd";
    public static final String DATE_TIME_REVERSE_FORMAT = "yyyy-MM-dd HH:mm:ss";
    public static final String DATE_TIME_JASPER_FORMAT = "yyyyMMddHHmmss";

    public static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern(DATE_TIME_FORMAT);
    public static final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern(TIME_FORMAT);
    public static final DateTimeFormatter DATE_TIME_SS_FORMATTER = DateTimeFormatter.ofPattern(DATE_TIME_SS_FORMAT);
    public static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern(DATE_FORMAT);
    public static final DateTimeFormatter DATE_REVERSE_FORMATTER = DateTimeFormatter.ofPattern(DATE_REVERSE_FORMAT);
    public static final DateTimeFormatter DATE_TIME_REVERSE_FORMATTER = DateTimeFormatter.ofPattern(DATE_TIME_REVERSE_FORMAT);
    public static final DateTimeFormatter DATE_TIME_JASPER_FORMATTER = DateTimeFormatter.ofPattern(DATE_TIME_JASPER_FORMAT);

    public static long getExpireTimeByDaysCount(int daysCount) {
        return daysCount * 24 * 60 * 60;
    }

    public static long getDaysBetween(LocalDateTime dateTime, LocalDateTime dateTime1) {
        return Duration.between(dateTime, dateTime1).toDays();
    }

}
