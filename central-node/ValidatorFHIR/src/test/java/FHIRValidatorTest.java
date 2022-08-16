import org.apache.commons.io.FileUtils;
//import org.hl7.fhir.r5.utils.EOperationOutcome;
import java.io.*;
import java.nio.charset.StandardCharsets;

public class FHIRValidatorTest {

    public static void main(String[] arg) throws IOException {

        //File file = new File("/home/simone/UniTn/IEHR/IEHR-server/RDS/central-node/ValidatorFHIR/src/main/resources/RDD-bundle.json");
        //File file = new File("/home/simone/UniTn/IEHR/IEHR-server/test-files/MedicationRequest-example_JSON.json");
        File file = new File("/home/simone/UniTn/IEHR/IEHR-server/RDS/central-node/login-upload/RDD/Interval RDDBundle-PDF_v4_contained_questionnaire.json");


        String resource = FileUtils.readFileToString(file, String.valueOf(StandardCharsets.UTF_8));
        FHIRValidator fhirValidator = new FHIRValidator();
        String res = fhirValidator.validate(resource);
        System.out.println(res);

        System.out.println("-------SECOND-------");

        res = fhirValidator.validate(resource);
        System.out.println(res);
    }
}
