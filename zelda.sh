 #!/usr/bin/env bash

network_info=$(ifconfig)

echo "who are you?"
read name
echo "Hello, $name."
echo "what are you doing here?"
read coding
echo "It's DANGEROUS to go alone, take this network info with you."
echo $network_info
