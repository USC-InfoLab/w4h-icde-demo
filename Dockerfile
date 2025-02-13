FROM python:latest  
# Tested with python:3.13.2
WORKDIR /app

COPY . .

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install necessary packages (vim, emacs, git, zsh, etc.)
RUN apt-get update && apt-get install -y \
    vim \
    emacs \
    git \
    zsh \
    curl \
    postgresql-client \
    libgdal-dev \
    gdal-bin \
    build-essential \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Install oh-my-zsh and set the robbyrussell theme as default
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/' ~/.zshrc

# Set zsh as the default shell
RUN chsh -s $(which zsh)

#create venv
#RUN python -m venv /app/venv

RUN pip install --upgrade pip
# Install Python dependencies
RUN pip install -r requirements.txt

RUN chmod +x /app/inituser_and_start.sh

# Run the entrypoint script when the container starts
CMD ["./inituser_and_start.sh"]

