# hk-proxy

Forward to a new hosting provider while migrating off of Heroku.

Original motivation: https://github.com/awseward/call_status/issues/171

### Heroku setup

```sh
heroku create
heroku config:set FWD_TO='https://your-app.example.com'
heroku stack:set container
git push heroku main
```
### Run locally

```sh
docker build -t hk-proxy .
docker run -it --rm \
  -p 5000:81 \
  -e PORT=81 \
  -e FWD_TO='https://your-app.example.com' \
  --name web \
  hk-proxy
```

