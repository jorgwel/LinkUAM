/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package mx.uam.azc.link.test;

import org.jboss.seam.mock.SeamTest;
import org.testng.annotations.Test;

public class RegisterTest extends SeamTest {

  @Test
  public void testRegisterComponent() throws Exception {

    new ComponentTest() {

      protected void testComponents() throws Exception {
        setValue("#{user.username}", "1ovthafew");
        setValue("#{user.name}", "Gavin King");
        setValue("#{user.password}", "secret");
        assert invokeMethod("#{register.register}").equals("success");
        assert getValue("#{user.username}").equals("1ovthafew");
        assert getValue("#{user.name}").equals("Gavin King");
        assert getValue("#{user.password}").equals("secret");
      }

    }.run();

  }

}
