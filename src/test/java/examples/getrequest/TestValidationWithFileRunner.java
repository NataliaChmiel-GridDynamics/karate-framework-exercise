package examples.getrequest;

import com.intuit.karate.junit5.Karate;

public class TestValidationWithFileRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("ValidationUsingFile").relativeTo(getClass());
    }
}



