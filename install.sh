!#/bin/bash
pip install --upgrade pip

cd docker
docker build -t abg .

# Remove the container if it exists and run the container
docker rm -f abg_container
docker run -d --name abg_container abg
docker ps -f name=abg_container

# Env bioinformatics packages
# List of bioinformatics packages to check and install if not present
packages=("spades" "fastqc" "git" "python3-matplotlib" "pkg-config" "libfreetype6-dev" "libpng-dev" "python3" "python-setuptools")

for package in "${packages[@]}"; do
    if ! command -v $package &> /dev/null; then
        sudo apt install -y $package
    else
        echo "$package is already installed."
    fi
done

# Install quast
#git clone https://github.com/ablab/quast.git
#bash quast/install.sh

# prokka container
docker pull staphb/prokka:latest
docker run staphb/prokka:latest prokka -h