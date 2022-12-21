@REM packer build -force .\rocky8.json
vagrant cloud publish --force --release --version-description "VirtualBox 7.0.4, Vagrant 2.3.4, Docker 20.10.17" skalinkin/rocky-9 2022.351.1 virtualbox ./builds/virtualbox-rocky-9.box
