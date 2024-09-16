package examples.getrequest.queryparameters;

import com.intuit.karate.junit5.Karate;

public class TestQueryParameterRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("queryParameter").relativeTo(getClass());
    }
}
