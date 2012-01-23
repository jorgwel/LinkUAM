package mx.uam.azc.link.model.validadores;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.*;
import static java.lang.annotation.RetentionPolicy.*;

import org.hibernate.validator.ValidatorClass;

/**
 * Interfaz tomada de Clase tomada de
 * http://seamframework.org/Community/SeamCustomValidator
 *
 * @author Kariem Hussein
 */
@ValidatorClass(PasswordPolicyRestrictedValidator.class)
@Target({FIELD, METHOD})
@Retention(RUNTIME)
@Documented
public @interface PasswordPolicyRestricted {

    /** @return minimum number of characters from a-z (lower or upper case) */
    int minAlphas() default 0;

    /** @return minimum number of digits */
    int minDigits() default 0;

    /** @return error message key */
    String message() default "{validador.password.mensaje}";
}
