FROM nginx:1.23.1

COPY ./nginx.conf .
COPY ./entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
