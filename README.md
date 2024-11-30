# Native Camera App

This application utilizes native platform capabilities to implement the following features:

1. Interaction with native code via `MethodChannel`.
2. Using the device's camera to take photos and display them in the app.

## Features

- The user can take a photo using the smartphone's camera, which will then be displayed in the app.
- The user can press a button to receive a message from the native code (a static text "Hi, Mom!" is returned).

## Functionality

1. **Take a Photo**: Using the "Take a photo" button, the user can capture a photo, which will be displayed within the app interface.
2. **Get Hello Message**: Using the "Get Hello Message" button, the user can retrieve a message from the native code via `MethodChannel`. This message is a simple text: "Hi, Mom!".

## Technologies Used

- **Flutter**: A cross-platform framework for building mobile apps.
- **Image Picker**: A package for capturing photos or picking images from the gallery.
- **MethodChannel**: For communication with native Android and iOS code.
