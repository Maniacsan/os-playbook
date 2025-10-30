cd mac-playbook/ &&
ansible-galaxy install -r requirements.yml &&
echo "Enter your macOS account password when prompted for the 'BECOME' password." &&
ansible-playbook main.yml --ask-become-pass &&
cd ..