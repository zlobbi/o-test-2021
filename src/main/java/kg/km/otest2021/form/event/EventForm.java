/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.form.event;

import kg.km.otest2021.entity.event.Event;
import kg.km.otest2021.util.TimeHelper;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Data
@NoArgsConstructor
public class EventForm {

    private Long id;

    @NotBlank
    private String title;

    private String description;

    @NotNull
    @DateTimeFormat(pattern = TimeHelper.DATE_TIME_REVERSE_FORMAT)
    private LocalDateTime start;

    @NotNull
    @DateTimeFormat(pattern = TimeHelper.DATE_TIME_REVERSE_FORMAT)
    private LocalDateTime end;

    private String type = "#f5c6cb";

    public Event toEvent() {
        return new Event()
                .setTitle(this.title)
                .setDescription(this.description)
                .setStart(this.start)
                .setEnd(this.end);
    }
}
