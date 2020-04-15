# Music Migrator
Transfer playlists between Spotify & Google Play Music with ease!

## Development Guide

### Environment

#### Python 
The following environment variables are minimum but others are available at: `https://docs.djangoproject.com/en/3.0/ref/settings/` 
```
# Python settings
PYTHONPATH=/home/www/music-migrator/src/api/music_migrator
DEBUG=1
DJANGO_ALLOWED_HOSTS="music-migrator.fm localhost 127.0.0.1 0.0.0.0 [::1]"
DJANGO_HOST=0.0.0.0
DJANGO_PORT=8000
SECRET_KEY=<MY_SECRET_KEY>
WEBROOT=/home/www/music-migrator/src
USER_ID=1000
GROUP_ID=1000

# Postgres SQL settings
SQL_ENGINE=django.db.backends.postgresql
POSTGRES_DATABASE=musicmigrator
POSTGRES_USER=musicmigrator
POSTGRES_PASSWORD=musicmigrator
POSTGRES_HOST=mmpostgres
POSTGRES_PORT=5432
```

#### Nginx
```
WEBROOT=/home/www/music-migrator/src
TEMPLATE=music-migrator.portchris.co.uk
VIRTUAL_ROOT=/home/www/music-migrator
VIRTUAL_HOST=music-migrator.portchris.co.uk
VIRTUAL_PORT=8081
LETSENCRYPT_EMAIL=<MY_EMAIL>
LETSENCRYPT_HOST=music-migrator.portchris.co.uk
LETSENCRYPT_TEST=true
USER_ID=1000
GROUP_ID=1000
```

#### Node.Js NPM

Start the development server using: 

```
npm run dev
```

This will load Next.Js default development server which will have access to built-in Webpack modules such as BrowserSync.


When ready to package up the app, run:

*Linux / Mac OSX*
```
NODE_ENV=production npm run build
PORT=80 npm run start 
```

*Windows*
On Windows, you will need to run the command differently. One option is to install the npm module `cross-env` into your app:

```
cross-env NODE_ENV=production npm run build
```
