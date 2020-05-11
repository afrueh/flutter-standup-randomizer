# Standup Randomizer

Helps you with your daily Scrum Stand-Up by randomizing the order, provide a time-box and more


## Development

Follow the guidelines in the flutter documentation to enable flutter to run Web Applications:

[https://flutter.dev/docs/get-started/web](https://flutter.dev/docs/get-started/web)

### Update the secrets.json file

Flickr is used to fetch an interesting picture as background. For this feature to work the secrets.json needs to be created.

1. Copy secrets.json.template
2. Insert your own private Flickr API-Key [https://www.flickr.com/services/api/keys/](https://www.flickr.com/services/api/keys/)

### Run

Run the Application:
```
    flutter run -d chrome
```

### Deploy

```
    flutter build web
```