# Marvel Heroes App

![undefined - Imgur](https://user-images.githubusercontent.com/89124140/197192085-ee7b5b01-6bd7-4282-9d57-aa773588be5d.gif)

---

## Description
This application was developed to provide information about Marvel Comics heroes. It uses the Marvel API to fetch data about heroes and Firebase for user authentication.

---

## Features

- **User Login:** Users can create accounts or log in using Firebase Authentication.
- **Heroes Display:** Marvel heroes are displayed in an attractive and easy-to-use interface.
- **Hero Details:** Details of each hero can be viewed, including their description, images, and related information.
- **Favorites:** Users can mark heroes as favorites and easily access them later.
- **Search:** Users can search for heroes by name.

---

## Technologies Used

- **Alamofire:** Used to make HTTP requests to the Marvel API.
- **Firebase:** Used for user authentication and data storage.
- **SDWebImage:** Used for handling and displaying images fetched from the Marvel API.
- **Storyboard:** User interface built visually.

---

## Prerequisites

- Xcode 12.0 or higher
- Cocoapods

---

## Installation

1. Clone the repository:
git clone https://github.com/Otomanim/Projeto-Marvel.git

2. Navigate to the project directory:
cd repository-name

3. Install dependencies using Cocoapods:
pod install

4. Open the `MarvelHeroes.xcworkspace` file in Xcode.

5. Insert your Marvel API and Firebase keys into the `Keys.plist` file:

```xml
 <plist version="1.0">
 <dict>
    <key>MarvelPublicKey</key>
    <string>INSERT_YOUR_MARVEL_API_PUBLIC_KEY_HERE</string>
    <key>MarvelPrivateKey</key>
    <string>INSERT_YOUR_MARVEL_API_PRIVATE_KEY_HERE</string>
    <key>FirebaseAPIKey</key>
    <string>INSERT_YOUR_FIREBASE_API_KEY_HERE</string>
 </dict>
 </plist>
```
6. Run the application on the simulator or device.

---

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

---

## Contribution

Contributions are welcome! Please follow the [contribution guidelines](CONTRIBUTING.md).

---

## Authors

- [Evandro Rodrigo Minamoto](https://github.com/Otomanim)

---

## Support

For questions or issues, please create an [issue](https://github.com/Otomanim/Projeto-Marvel/issues).

---

## Acknowledgements

- [Alamofire](https://github.com/Alamofire/Alamofire)
- [Firebase](https://firebase.google.com/)
- [SDWebImage](https://github.com/SDWebImage/SDWebImage)
- [Marvel API](https://developer.marvel.com/)
- [Crashlytics](https://firebase.google.com/docs/crashlytics)

---

**© 2024 Your Name**
