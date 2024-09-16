package examples.deleterequest;

import com.intuit.karate.junit5.Karate;

public class TestDeleteRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("deleteJobEntry").relativeTo(getClass());
    }
}
