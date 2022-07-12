#!/usr/bin/env bash

function open_ssl_p12_to_pem() {
	echo "Processing $1, connecting to $2..."

	# Replaces .p12 with .pem
	# https://stackoverflow.com/a/61294531
	P12_FILENAME=$1
	PEM_FILENAME="${1%.*}.pem"
	SERVER=$2

	echo ""
	echo "open_ssl_p12_to_pem: [1] Creating .pem file from .p12 file..."
	echo ""

	openssl pkcs12 -in "$P12_FILENAME" -out "$PEM_FILENAME" -nodes -clcerts

	echo ""
	echo "open_ssl_p12_to_pem: [2] Verifying .p12 file..."
	echo ""

	openssl s_client -connect $SERVER -cert "$PEM_FILENAME" -debug -showcerts

	echo ""
	echo "open_ssl_p12_to_pem: [3] Printing .pem file content..."
	echo ""
	echo ""
	echo "===================== open_ssl_p12_to_pem ======================"
	echo "                       .pem file content                        "
	echo "================================================================"
	echo ""
	echo ""
	cat "$PEM_FILENAME"
	echo ""
	echo ""
	echo "================================================================"
	echo ""

	echo ""
	echo "Done!"
	echo "$PEM_FILENAME"
}
