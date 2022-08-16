
import combinedvalidator.CombinedValidator;
import combinedvalidator.IGInstaller;
import org.apache.commons.io.FileUtils;
import org.hl7.fhir.r5.model.OperationOutcome;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class FHIRValidator {

    public FHIRValidator() {}

    public IGInstaller IGinstaller;

    public static void main(String[] args) throws IOException {
        File file = new File(args[0]);
        String resource = FileUtils.readFileToString(file, String.valueOf(StandardCharsets.UTF_8));
        validate(resource);
    }

    public static String validate(String resource) throws IOException{

        IGInstaller.installGs();

        CombinedValidator combinedValidator = new CombinedValidator();
        OperationOutcome operationOutcome = null;
        try {
            operationOutcome = combinedValidator.validateResource(resource,true);
        } catch (Exception e) {
            e.printStackTrace();
        }
        int error = 0;
        int warning = 0;
        int note = 0;
        for (OperationOutcome.OperationOutcomeIssueComponent component : operationOutcome.getIssue()) {
            switch (component.getSeverity()){
                case FATAL:
                case NULL:
                    break;
                case ERROR:
                    error+=1;
                    break;
                case WARNING:
                    warning+=1;
                    break;
                case INFORMATION:
                    note+=1;
                    break;
            }
            System.out.println(component.getSeverity() + ":" + component.getDetails().getText());
        }
        //System.out.println(error +" errors, "+ warning+" warnings, "+ note+ " notes");
        return  error +" errors, "+ warning+" warnings, "+ note+ " notes";
    }

}
