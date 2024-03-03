# read txt file to array by url lines, then download each url using megadl function included username and password or nothing
# Usage: ./megatools-downloader.sh <file.txt> <username> <password>
# Example: ./megatools-downloader.sh file.txt username password
# Example: ./megatools-downloader.sh file.txt


# Check if file.txt is provided
if [ -z $1 ]; then
    echo "Usage: ./megatools-downloader.sh <file.txt> <username> <password>"
    echo "Example: ./megatools-downloader.sh file.txt username password"
    echo "Example: ./megatools-downloader.sh file.txt"
    exit 1
fi

# Check if file.txt exists
if [ ! -f $1 ]; then
    echo "Error: file.txt not found"
    exit 1
fi

# Read file.txt to array
array=()
while IFS= read -r line; do
    array+=("$line")
done < $1

# Check if username and password are provided
if [ -z $2 ] && [ -z $3 ]; then
    echo "Username and password are not provided"
    echo "Download without username and password"
    for url in "${array[@]}"; do
        megadl $url
    done
else
    echo "Username and password are provided"
    for url in "${array[@]}"; do
        megadl --username $2 --password $3 $url
    done
fi


