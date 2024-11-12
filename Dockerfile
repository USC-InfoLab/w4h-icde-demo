FROM python:3.8-slim

WORKDIR /app

COPY . .

# Install necessary packages (vim, emacs, git, zsh, etc.)
RUN apt-get update && apt-get install -y \
    vim \
    emacs \
    git \
    zsh \
    curl \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Install oh-my-zsh and set the robbyrussell theme as default
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/' ~/.zshrc

# Set zsh as the default shell
RUN chsh -s $(which zsh)

RUN pip install -r requirements.txt

RUN chmod +x /app/inituser_and_start.sh

# 在容器启动时运行 entrypoint.sh 脚本
CMD ["./inituser_and_start.sh"]

