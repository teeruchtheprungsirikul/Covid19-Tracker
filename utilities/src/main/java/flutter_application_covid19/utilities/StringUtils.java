/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package flutter_application_covid19.utilities;

import flutter_application_covid19.list.LinkedList;

public class StringUtils {
    public static String join(LinkedList source) {
        return JoinUtils.join(source);
    }

    public static LinkedList split(String source) {
        return SplitUtils.split(source);
    }
}
