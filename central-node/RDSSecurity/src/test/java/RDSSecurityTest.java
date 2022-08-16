import java.io.FileReader;
import java.io.IOException;
import java.security.*;
import java.security.cert.CertificateException;


class RDSSecurityTest {

    public static void main(String [] args) throws CertificateException, UnrecoverableKeyException, NoSuchAlgorithmException, KeyStoreException, SignatureException, InvalidKeyException, IOException {
        RDSSecurity rdsSigner = new RDSSecurity();

        FileReader reader = new FileReader(args[0]);
        String payload = reader.toString();

        rdsSigner.signRDD(payload);
    }

}