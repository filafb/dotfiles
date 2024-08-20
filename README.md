# dotfiles

Highly inspired by https://github.com/driesvints/dotfiles

## How to use it

### Setup an SSH key

```bash
curl https://raw.githubusercontent.com/filafb/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
```

### Clone this repository

```bash
git clone --recursive git@github.com:filafb/dotfiles.git ~/.dotfiles
```

### Run the installation

```bash
cd ~/.dotfiles && chmod +x ./config-it.sh && ./config-it.sh
```

### Restore preferences
After mackup is synced with your cloud storage, restore preferences by running mackup restore
_The restore will run the files saved in the cloud storage. To modify the backed up files, run mackup backup again. It's possible to create targeted backups by modifying the .mackup.cfg file._
