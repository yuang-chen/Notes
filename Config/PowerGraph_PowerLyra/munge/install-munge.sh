
# install munge locally
sudo yum localinstall munge munge-libs munge-devel -y

#Create the global users
export MUNGEUSER=2001
groupadd -g $MUNGEUSER munge
useradd  -m -c "MUNGE Uid 'N' Gid Emporium" -d /var/lib/munge -u $MUNGEUSER -g munge  -s /sbin/nologin munge
export SLURMUSER=2002
groupadd -g $SLURMUSER slurm
useradd  -m -c "SLURM workload manager" -d /var/lib/slurm -u $SLURMUSER -g slurm  -s /bin/bash slurm

#create the key on MASTER node
sudo yum install rng-tools -y
sudo rngd -r /dev/urandom
sudo /usr/sbin/create-munge-key -r
sudo dd if=/dev/urandom bs=1 count=1024 > /etc/munge/munge.key
sudo chown munge: /etc/munge/munge.key
sudo chmod 400 /etc/munge/munge.key

#send the key from master to computing nodes
sudo scp /etc/munge/munge.key root@gpu01:/etc/munge
sudo scp /etc/munge/munge.key root@gpu02:/etc/munge
sudo scp /etc/munge/munge.key root@gpu03:/etc/munge
sudo scp /etc/munge/munge.key root@gpu04:/etc/munge
sudo scp /etc/munge/munge.key root@gpu05:/etc/munge
sudo scp /etc/munge/munge.key root@gpu06:/etc/munge
sudo scp /etc/munge/munge.key root@gpu07:/etc/munge
sudo scp /etc/munge/munge.key root@gpu08:/etc/munge

# SSH into every node and correct the permissions as well as start the Munge service:
sudo chown -R munge: /etc/munge/ /var/log/munge/
sudo chmod 0700 /etc/munge/ /var/log/munge/
sudo systemctl enable munge
sudo systemctl start munge

