#!/bin/bash

# Function to display top 10 applications consuming the most CPU and memory
top_applications() {
    echo "Top 10 applications by CPU and memory usage:"
    ps aux --sort=-%cpu,-%mem | head -n 11
}

# Main script execution
top_applications

# Function to display network monitoring details
function network_monitoring() {
  echo "Number of concurrent connections to the server:"
  ss -t -a | wc -l

  echo ""
  echo "Packet drops:"
  netstat -i | grep -i "Drop"

  echo ""
  echo "Network Traffic (MB in and out):"
  ifconfig | grep 'RX packets\|TX packets' -A 1
}

#Main script execution
network_monitoring

# Function to display disk usage
function disk_usage() {
  echo "Disk space usage by mounted partitions:"
  df -h | awk '$5 > 80 {print $0; system("tput setaf 1")} $5 <= 80 {print $0; system("tput setaf 7")}'
}

#Main script execution
disk_usage

# Function to display system load
function system_load() {
  echo "Current load average for the system:"
  uptime

  echo ""
  echo "CPU usage breakdown:"
  top -b -n 1 | grep Cpu
}

#Main script execution
system_load

# Function to display memory usage
function memory_usage() {
  echo "Memory usage (total, used, free):"
  free -h

  echo ""
  echo "Swap memory usage:"
  free -h | grep "Swap"
}

#Main script execution
memory_usage

# Function to display process monitoring
function process_monitoring() {
  echo "Number of active processes:"
  ps aux | wc -l

  echo ""
  echo "Top 5 processes by CPU usage:"
  ps aux --sort=-%cpu | head -n 6

  echo ""
  echo "Top 5 processes by memory usage:"
  ps aux --sort=-%mem | head -n 6
}

#Main script execution
process_monitoring

# Function to monitor essential services
function service_monitoring() {
  echo "Monitoring essential services:"
  services=("sshd" "nginx" "iptables")

  for service in "${services[@]}"; do
    echo -n "$service: "
    systemctl is-active $service
  done
}

#Main script execution
service_monitoring


