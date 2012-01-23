/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.uam.azc.link.action.auth;

import java.security.MessageDigest;
import org.jboss.seam.annotations.Name;
import org.jboss.seam.util.Hex;

/**
 *
 * @author jorgwel
 */
@Name("passwordManager")
public class PasswordManager {

	private String digestAlgorithm;
	private String charset;

	public void setDigestAlgorithm(String algorithm) {
		this.digestAlgorithm = algorithm;
	}

	public void setCharset(String charset) {
		this.charset = charset;
	}

        /**
         * Hashea el password
         * @param plainTextPassword
         * @return
         */
	public String hash(String plainTextPassword) {
		setDigestAlgorithm("SHA-1");
		setCharset("UTF-8");
		try {
			MessageDigest digest =
                                    MessageDigest.getInstance(digestAlgorithm);
			digest.update(plainTextPassword.getBytes(charset));
			byte[] rawHash = digest.digest();
			return new String(Hex.encodeHex(rawHash));
			//            return plainTextPassword;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
