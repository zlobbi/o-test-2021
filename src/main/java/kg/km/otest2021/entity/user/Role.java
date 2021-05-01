/*
 * Created by Kadyrbek Mavlyanov
 * kadyrbek.mavlyanov@gmail.com
 * 2021.
 */

package kg.km.otest2021.entity.user;

import kg.km.otest2021.entity.base.BaseEntity;
import org.springframework.security.core.GrantedAuthority;

import javax.persistence.Column;
import javax.persistence.Entity;

@Entity
public class Role extends BaseEntity implements GrantedAuthority {

    @Column
    private String role;

    @Override
    public String getAuthority() {
        return this.role;
    }
}
