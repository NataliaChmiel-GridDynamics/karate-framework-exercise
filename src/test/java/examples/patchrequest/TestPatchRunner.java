package examples.patchrequest;

import com.intuit.karate.junit5.Karate;

public class TestPatchRunner {
    @Karate.Test
    public Karate runTest() {
        return Karate.run("updateJobDescription").relativeTo(getClass());
    }
}
