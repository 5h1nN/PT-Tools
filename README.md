# PT-tools
Contain some of the well-known tools and self-written scripts that I normally used for a VAPT.

# Recon
- `ffuf` Directory and parameter bruteforcing
- `nmap` Port scanner and simple N-day checks
- `subbrute` Checks for valid subdomain based on DNS. Can be checked with httpx to check if the subdomain is still in use. 
- `httpx` Checks if host is alive.
- `retirejs` Check for old javascripts
- `wapplyzer` Check for language and framework used
  
# Exploitation
- `burpsuite` Proxy to intercept and modify request. 
- `foxyproxy` Easier management of proxy. 
- `autorize` Burp plugin. Useful for checking IDOR.
- `sqlmap` Useful tool for autopwning target vulnerable to SQLi.
- `webhook.site` [LINK](https://webhook.site/) Useful site for getting callback.
- `cyberchef` [LINK](https://gchq.github.io/CyberChef/) Useful site for encoding and decoding strings.

# Post Exploitation 
- `linenum.sh` Shell script to check for common LPE vulnerabilities (linux) 
- `winPEAS` Shell script to check for common LPE vulnerabilities (windows)
- `revshell generator` [LINK](https://www.revshells.com/) Useful site for generating reverse shell.

# Mobile
- `frida` [SCRIPT](https://codeshare.frida.re/) Hook and inject script during runtime. Useful for bypassing root detection and SSL pinning.
- `jad-gui`  Deceompiling .apk file (GUI). Useful for getting a brief overview of which is in the .apk file.
- `apktool` Decompile and recompile .apk file 
- `signapk` Signing .apk file.
  
# OT 
- `Wireshark` Analyze network packet sent within network. Useful for decoding packets too.
- `mqtt` [LINK](https://github.com/hivemq/mqtt-cli) Client for connecting MQTT application.
- `opcua-client-gui` [LINK](https://github.com/FreeOpcUa/opcua-client-gui) Client for coneecting to opc-ua application.
- `pylogix` [LINK](https://github.com/dmroeder/pylogix) Library for communicating with Allen Bradley Compact/Control Logix PLC
 
# VA
- `ldapsearch` Can use to dump the whole LDAP tree and check for anonymous login

# Disclaimer 
Please use the tools/script with care and knowledge and seek the approval from the target(s) before running these tool. Some of the tool will result in high traffic flow which may cause unintentional denial-of-service. 
