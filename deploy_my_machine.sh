# usage:
# wget -O - https://raw.githubusercontent.com/luzfcb/playbooks/master/deploy_my_machine.sh | bash
# ainda nao funciona por esse modo, preciso descobrir porque nao esta travando ate na hora de digitar a senha
# contudo, se vc baixar e excutar com ./deploy_my_machine.sh ele funciona
# 
# ps: I am no security expert
# 
# http://unix.stackexchange.com/questions/10922/temporarily-suspend-bash-history-on-a-given-shell

# http://stackoverflow.com/a/2654048/2975300

# http://stackoverflow.com/a/28393320/2975300

github_username="luzfcb"
playbooks_repro_name="playbooks"

repro_zip_package_url="https://github.com/$github_username/$playbooks_repro_name/archive/master.zip"

current_user="$USER"
current_directory=$(pwd)

function read_secret()
{   
    
    # Disable echo.
    stty_orig=$(stty -g)
    stty -echo

    # Set up trap to ensure echo is enabled before exiting if the script
    # is terminated while echo is disabled.
    trap 'stty echo' EXIT

    # run command
    read -p "[sudo] password for $current_user": user_passwd

    # Enable echo.
    stty "$stty_orig"
    stty echo
    trap - EXIT

    # Print a newline because the newline entered by the user after
    # entering the passcode is not echoed. This ensures that the
    # next line of output begins at a new line.
    echo
}


function install_ansible_and_other_required_tools(){
    ansible_repro=$(ls /etc/apt/sources.list.d/ | grep ansible-ansible-)

    if [[ -z $ansible_repro ]]; then
        sudo -S <<< "$user_passwd" add-apt-repository ppa:ansible/ansible --yes
    fi

    
    sudo -S <<< "$user_passwd" apt-get update
    sudo -S <<< "$user_passwd" apt-get install ansible wget unzip --yes
}

function run_playbook(){
    local file_name="$playbooks_repro_name.zip"
    local file_full_output_path="/tmp/deploy_my_machine/$file_name"
    cd /tmp || exit
    rm -r /tmp/deploy_my_machine 2> /dev/null 
    mkdir -p /tmp/deploy_my_machine
    cd /tmp/deploy_my_machine || exit
    wget -O $file_full_output_path "$repro_zip_package_url"

    unzip $playbooks_repro_name
    cd "$playbooks_repro_name-master" || exit
    
    echo "running playbook"
    ansible-playbook workstation.yml --extra-vars "ansible_become_pass=$user_passwd"
    cd current_directory
    rm -r /tmp/deploy_my_machine 2> /dev/null 
}


# temporary disable history record
set +o history

# read current user password
read_secret

# add ansible ppa and install ansible, wget and unzip
install_ansible_and_other_required_tools

run_playbook

unset user_passwd

cd current_directory

# re-enable history record
set -o history

