package examples.postrequest;

import com.intuit.karate.junit5.Karate;


public class TestPostRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("createJobEntry", "schemaValidation").relativeTo(getClass());
    }
}
