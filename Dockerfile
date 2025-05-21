FROM mcr.microsoft.com/azure-cli

COPY delete_empty_repos.sh /delete_empty_repos.sh
RUN chmod +x /delete_empty_repos.sh

CMD ["/bin/bash", "/delete_empty_repos.sh"]
