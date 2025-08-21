grep "LimitNOFILE=infinity" /usr/lib/systemd/system/containerd.service 
if [ $? -ne 0 ]; then
  sed -i '/^LimitCORE/a\LimitNOFILE=infinity' /usr/lib/systemd/system/containerd.service && systemctl daemon-reload && systemctl restart containerd
  echo "Patching $HOSTNAME"
fi
