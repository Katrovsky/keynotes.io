# keynotes.io

## Remove 'subvolid=*' from fstab
```bash
sudo sed -i 's/subvolid=.*,//' /etc/fstab
```
