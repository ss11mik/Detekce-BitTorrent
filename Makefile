# Makefile
#
# project: Bittorrent Traffic Detection
# author: xmikul69
# course: PDS @ FIT VUT
# 2023

PCAP=../data/qbit-init-download.pcapng
CSV=../data/qbit-init-download.pcapng.csv

csv: $(CSV)

$(CSV):
	./pcapng_to_csv.sh $(PCAP)


init: $(CSV)
	python3 bt-monitor -init -csv $(CSV)

peers: $(CSV)
	python3 bt-monitor -peers -csv $(CSV)

download: $(CSV)
	python3 bt-monitor -download -csv $(CSV)


dns:
	python3 bt-monitor -dns -pcap $(PCAP)

http:
	python3 bt-monitor -http -pcap $(PCAP)

ports:
	python3 bt-monitor -ports -pcap $(PCAP)

ping: $(CSV)
	python3 bt-monitor -ping -csv $(CSV)

tcpudpport: $(CSV)
	python3 bt-monitor -tcpudpport -pcap $(PCAP)



csv-all:
	for i in ../data/*.pcapng; do echo "$$i"; ./pcapng_to_csv.sh $$i; done

init-all:
	for i in ../data/*.csv; do echo "$$i:"; python3 bt-monitor -init -csv $$i; done

peers-all:
	for i in ../data/*.csv; do echo "$$i:"; python3 bt-monitor -peers -csv $$i; done

download-all:
	for i in ../data/*.csv; do echo "$$i:"; python3 bt-monitor -download -csv $$i; done


dns-all:
	for i in ../data/*.pcapng; do echo "$$i:"; python3 bt-monitor -dns -pcap $$i; done

http-all:
	for i in ../data/*.pcapng; do echo "$$i:"; python3 bt-monitor -http -pcap $$i; done

ports-all:
	for i in ../data/*.pcapng; do echo "$$i:"; python3 bt-monitor -ports -pcap $$i; done

ping-all:
	for i in ../data/*.csv; do echo "$$i:"; python3 bt-monitor -ping -csv $$i; done


tcpudpport-all:
	for i in ../data/*.pcapng; do echo "$$i:"; python3 bt-monitor -tcpudpport -pcap $$i; done