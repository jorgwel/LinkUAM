package mx.uam.azc.link.model.validadores;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.validator.Validator;

/**
 * Clase tomada de http://seamframework.org/Community/SeamCustomValidator
 *
 * @author Kariem Hussein
 * @date 29/05/2011
 */
public class PasswordPolicyRestrictedValidator implements
        Validator<PasswordPolicyRestricted> {

    Pattern ALPHA = Pattern.compile("[a-zA-Z]");
    Pattern DIGIT = Pattern.compile("\\d");
    private PasswordPolicyRestricted policy;

    /** @see Validator#initialize(Annotation) */
    public void initialize(PasswordPolicyRestricted passwordPolicy) {
        this.policy = passwordPolicy;
    }

    public boolean isValid(Object o) {
        if (o == null) {
            return false;
        }
        if (o instanceof String) {
            return isValid((String) o);
        }
        return isValid(o.toString());
    }

    /**
     * @param password
     *            the password to check
     * @return whether password is valid according to its annotation
     */
    public boolean isValid(String password) {
        return check(password, policy.minAlphas(), ALPHA)
                && check(password, policy.minDigits(), DIGIT);
    }

    /**
     * @param sequence
     *            the sequence to check
     * @param min
     *            minimum number of {@code pattern}
     * @param pattern
     *            the pattern to check
     */
    private boolean check(String sequence, int min, Pattern pattern) {
        if (min > 0) {
            Matcher m = pattern.matcher(sequence);
            int count = 0;
            while (m.find()) {
                count++;
            }
            if (min > count) {
                return false;
            }
        }
        return true;
    }
}
