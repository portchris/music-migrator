# Music Migrator
Transfer playlists between Spotify & Google Play Music with ease!

## Development Guide

### Environment

#### Python 
The following environment variables are minimum but others are available at: `https://docs.djangoproject.com/en/3.0/ref/settings/` 
```

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
