# Apache Server Deployment Script

This is a simple shell script that automates the deployment of an Apache server for a specified github repository. The script downloads the contents of the repository and copies them to the `/var/www/html/` directory, making the files accessible through a web browser.

### Prerequisites

   * Ubuntu or similar Linux distribution
   * Apache2 web server
   * unzip command-line utility

## Usage

To use this script, simply run the following command in your terminal:

> bash

    $ sudo ./apache-server.sh -r <repository_url> [-b <branch_name>]

Replace <repository_url> with the URL of the repository you want to deploy. If the repository is hosted on GitHub, the URL should be in the following format:

> URL

    https://github.com/<username>/<repository>/archive/<branch>.zip

Replace <username> with the username of the repository owner, <repository> with the name of the repository, and <branch> with the name of the branch you want to deploy. If no branch is specified, the script will use the default branch (main).

Optionally, you can use the -b or --branch option to specify a different branch:

> bash

    $ sudo ./apache-server.sh -r <repository_url> -b <branch_name>

## Security Considerations

Keep in mind that running this script as a sudo user grants it root privileges, which could potentially be dangerous if the script is compromised. Therefore, it is recommended that you review the script's contents and run it on a trusted machine.

Additionally, the script downloads and extracts arbitrary files from the internet, which could be used to deliver malicious code. Therefore, it is important to use this script only with repositories that you trust and have control over.
