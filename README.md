# openssl_p12_to_pem

<details open>

<summary>Table of contents</summary>

- [What does it do?](#what-does-it-do)
- [Prerequisite](#prerequisite)
- [Setup](#setup)
- [Usage](#usage)
- [Linking](#linking)
	- [First step: Know your environment](#first-step-know-your-environment)
		- [Option 1: Via utility script](#option-1-via-utility-script)
		- [Option 2: By hand](#option-2-by-hand)
	- [Final step: Apply changes](#final-step-apply-changes)

</details>

---

## What does it do?

It creates a `.pem` file for client certs and unencrypted private keys from of the given `.p12` file, then verifies it, using [`openssl`](https://www.openssl.org/docs/man1.1.1/man1/openssl-pkcs12.html) and finally outputs the contents of the `.pem` file.

This is a simple function. It isn't very tolerant to fault.


## Prerequisite

You need to download and install [`openssl`](https://www.openssl.org). In most cases, you don't need to do this as your operating system already ships with it.

## Setup

1. Follow the [Prerequisite](#prerequisite) instructions.

2. Clone this repository.
    ```sh
	git clone https://github.com/csantarin/openssl_p12_to_pem.git
    ```

3. Navigate to the repostitory folder.
	```sh
	cd <path/to/the/parent/of/your/local/copy>/openssl_p12_to_pem
	```

4. Expose the `openssl_p12_to_pem` function to command line.

	```sh
	source ./openssl_p12_to_pem.sh 
	```

5. Follow the [Linking](#linking) instructions to add this command to your command line permanently.

## Usage

Call the newly-installed `openssl_p12_to_pem` command.

```sh
# Call the function and provide an input file name
# - Include the trailing .p12 extension.
# - Include a path (relative or absolute) if necessary.
openssl_p12_to_pem <path/to/your/file>.p12
```

Example:

```sh
$ openssl_p12_to_pem ../my-project/aps_cert.p12

Processing ../my-project/aps_cert.p12 ...

open_ssl_p12_to_pem: [1] Creating .pem file from .p12 file...

Enter Import Password: # Your .p12's password, if you've specified it.
MAC verified OK

open_ssl_p12_to_pem: [2] Verifying .p12 file...

# Other verification content...
# Other verification content...
# Other verification content...

# Pay attention to the results here.

---
New, TLSv1/SSLv3, Cipher is AES256-SHA
Server public key is 2048 bit
Secure Renegotiation IS supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
SSL-Session:
    Protocol  : TLSv1
    Cipher    : AES256-SHA
    Session-ID: 
    Session-ID-ctx: 
    Master-Key: Key:XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    Key-Arg   : None
	Start Time: 1657607429
    Timeout   : 300 (sec)
    Verify return code: 0 (ok)
---

# Other verification content...

Printing .pem file content...


===================== open_ssl_p12_to_pem ======================
                       .pem file content                        
================================================================


Bag Attributes
    friendlyName: Apple Push Services: com.Example.Example 
    localKeyID: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 # A real localKeyID wouldn't be all 0s.
subject=/UID=com.Example.Example/CN=Apple Push Services: com.Example.Example/OU=4CWUR7L6M7/C=US
issuer=/CN=Apple Worldwide Developer Relations Certification Authority/OU=G4/O=Apple Inc./C=US
-----BEGIN CERTIFICATE-----
MIIGtzCCBZ+gAwIBAgIQcjYtQFsc+ZdTvfB1UwDuozANBgkqhkiG9w0BAQsFADB1
MUQwQgYDVQQDDDtBcHBsZSBXb3JsZHdpZGUgRGV2ZWxvcGVyIFJlbGF0aW9ucyBD
ZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTELMAkGA1UECwwCRzQxEzARBgNVBAoMCkFw
# ... more hashes ... #
=
-----END CERTIFICATE-----
Bag Attributes
    friendlyName: Andrew Santarin the Developer
    localKeyID: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 # A real localKeyID wouldn't be all 0s.
Key Attributes: <No Attributes>
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDGpIaKYtXXapqx
vo52g7KAoKPY5/2qJdnBggYvzHdLqtlRmrnukUcTJBRCLLobu8GfWkjeDdisDgC1
nQZ1QZg66HrWom1agouTWk3rwkrJvA3m5d5kokeorrVNnCXcRtkqc+SXHyn43DbG
# ... more hashes ... #
=
-----END PRIVATE KEY-----


================================================================

Done!
../my-project/aps_cert.mp4
```

## Linking

In case you don't want to constantly `source` the same same command over and over, you can link the script.

### First step: Know your environment

You should locate where your shell environment is.

Assumptions in the subsequent parts:
- Shell environment file: `.zshrc`
- Location: user home directory (`~`. In the following, it represents the `/Users/csantarin` folder).

#### Option 1: Via utility script

There's a `link.sh` file that can do this for you.

```sh
sh ./link.sh ~/zshrc
```

Result:

```
Retrieving this repository's working directory ...
/Users/csantarin/openssl_p12_to_pem

Adding to /Users/csantarin/.zshrc ...
Done!
```

#### Option 2: By hand

Copy this to your shell environment file.

```sh
source ~/openssl_p12_to_pem/openssl_p12_to_pem.sh
```

### Final step: Apply changes

`source` the changes immediately or launch a new command line session:

```sh
source ~/.zshrc
```
