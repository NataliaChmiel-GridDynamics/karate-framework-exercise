package examples.getrequest;

import com.intuit.karate.junit5.Karate;


public class TestGetRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("getRequest", "responseMatcher", "validateJSONArray").relativeTo(getClass());
    }
}
