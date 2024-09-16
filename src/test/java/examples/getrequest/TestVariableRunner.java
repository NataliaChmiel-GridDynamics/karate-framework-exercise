package examples.getrequest;

import com.intuit.karate.junit5.Karate;

public class TestVariableRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("Variables.feature").relativeTo(getClass());
    }
}



