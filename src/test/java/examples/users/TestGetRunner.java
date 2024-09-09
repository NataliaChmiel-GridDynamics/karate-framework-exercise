package examples.users;

import com.intuit.karate.junit5.Karate;


public class TestGetRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("getRequest", "responseMatcher", "validateJSONArray", "validateXMLResponse").relativeTo(getClass());
    }

    @Karate.Test
    public Karate runTestUsingClassPath() {
        return Karate.run("classpath:examples/users/getRequest.feature");
    }
}
