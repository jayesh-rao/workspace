# workspace
1. install ohmyzsh
2. copy these .rc files to your server'
3. install the zsh-highlight-syntax plugin from git
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
4. upgrade git to 2.24.1
   sudo yum remove git
   sudo yum -y install https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm
   sudo yum install git
   git --version
