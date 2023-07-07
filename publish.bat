@REM packer build -force .\rocky8.json
vagrant cloud publish --force --release --version-description "VirtualBox 7.0.8, Vagrant 2.3.7, Docker 24.0.2" skalinkin/rocky-9 2023.187.0 virtualbox ./builds/virtualbox-rocky-9.box
