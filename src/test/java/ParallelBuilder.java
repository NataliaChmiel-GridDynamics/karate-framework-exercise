
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilder {

    @Test
    public void executeKarateTest() {
        Builder aRunner = new Builder();
        aRunner.path("classpath:examples");
        Results result = aRunner.parallel(5);
        System.out.println("Total Feature => " + result.getFeatureResults());

        Assertions.assertEquals(0, result.getFailCount(), "There are Some Failed Scenarios ");

    }
}