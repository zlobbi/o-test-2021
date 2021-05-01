/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */
package kg.km.otest2021.repository;

import kg.km.otest2021.entity.event.Event;
import kg.km.otest2021.entity.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface EventRepository extends JpaRepository<Event, Long>, QueryByExampleExecutor<Event> {

    List<Event> findAllByStartBetweenAndUserOrderByEndDesc(LocalDateTime start, LocalDateTime end, User user);

    List<Event> findAllByUser(User user);
}
