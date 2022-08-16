import iehr.security.CryptoManagementFactory;
import iehr.security.api.CryptoManagement;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.security.*;
import java.security.cert.CertificateException;
import java.security.interfaces.RSAPublicKey;
import java.util.Base64;


public class RDSSecurity {

    public RDSSecurity() {
    }

    public static void main(String [] args) throws CertificateException, UnrecoverableKeyException, NoSuchAlgorithmException, KeyStoreException, SignatureException, InvalidKeyException, IOException {
        RDSSecurity rdsSigner = new RDSSecurity();
        rdsSigner.signRDD(args[0]);
    }

    public static String signRDD(String payload) throws UnrecoverableKeyException, CertificateException, NoSuchAlgorithmException, KeyStoreException, IOException, SignatureException, InvalidKeyException {
        File f = new File("keystore.jks");
        CryptoManagement cryptoManagement = CryptoManagementFactory.create();

        if (!(f.isFile() && f.canRead())) {
            cryptoManagement.fetchCertificate();
        }

        PrivateKey privateKey = cryptoManagement.getPrivateKey();
        RSAPublicKey rsaPublicKey = cryptoManagement.getPublicKey();
        String signed = cryptoManagement.signPayload(payload, privateKey);
        Boolean verify = cryptoManagement.verifyPayload(rsaPublicKey, payload.getBytes(), signed.getBytes());
        System.out.println("verify:"+verify);
        System.out.println("signed:"+signed);


        RSAPublicKey cert = cryptoManagement.getPublicKey();
        String certs = Base64.getEncoder().encodeToString(cert.getEncoded());
        System.out.println("cert:"+certs);
        
        return signed;

    }

}
