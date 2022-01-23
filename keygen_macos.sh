cd keys
openssl genrsa -des3 -out cert.key 2048
openssl req -x509 -new -nodes -key cert.key -sha256 -days 1825 -out cert.pem  -subj "/CN=localhost"
sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" cert.pem
cd ..
