# change localhost to server address and ip
rm -f local.* *.pem *.crt
openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
  -keyout local.key -out local.crt -subj "/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,DNS:www.local.net,IP:127.0.0.1"
openssl x509 -in local.crt -out cert.crt
openssl rsa -aes256 -in local.key -out local.encrypted.key
openssl req -out cert.csr -key local.encrypted.key -new
mv local.encrypted.key cert.key
rm local.crt local.key
chmod 600 cert.key
sudo cp cert.crt /usr/local/share/ca-certificates
sudo update-ca-certificates
