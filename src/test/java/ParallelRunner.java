

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

import static com.intuit.karate.Runner.*;

public class ParallelRunner {

    @Test
    public void executeKarateTests() {
//        Runner.parallel(getClass(), 5);
        Builder aRunner = new Builder();
        aRunner.path("classpath:examples");
        aRunner.parallel(5);
//        aRunner.parallel(aRunner);
    }
}