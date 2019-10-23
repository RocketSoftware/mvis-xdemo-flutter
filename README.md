# MVIS Mobile Demo

A new Flutter project.

## Getting Started

This project is a starting point for the XDemo Mobile Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

For help getting started with Flutter for **Android and Windows**, view the [Windows and Android integration with Flutter](https://mstapleton22.github.io/Windows-and-Android-integration-with-Flutter/) documentation.

### Prequisites / Dependencies
* Flutter SDK - This app depends on the Flutter SDK. The Flutter team has developed amazing online documentation. In order to get the MVoovies mobile app up and running, please follow the Flutter installion guide. Complete up to step 3, and then comeback to this wiki continue wth MVoovies specific steps. [Click Here - Flutter Install Guide](https://flutter.dev/docs/get-started/install)
* MultiValue Integration Server Community Edition - If MVIS is not installed on your machine, please click the link below and follow the included installation guide [here](https://www.rocketsoftware.com/product-categories/dbms-and-application-servers/rocket-u2-trials)
* UniVerse - If UniVerse is not installed on your machine, please find it [here](https://www.rocketsoftware.com/product-categories/dbms-and-application-servers/rocket-u2-trials) and follow the installation guide that can be found [here](https://docs.rocketsoftware.com/nxt/gateway.dll/RKBnew20%2Funiverse%2Fprevious%20versions%2Fv11.2.3%2Funiverse_installguide_v1123.pdf)

### Running a Local Instance of the Application

1. Clone [this](https://github.com/Chimer2017/xdemo_flutter) repo or run `git clone https://github.com/Chimer2017/xdemo_flutter.git`
2. `cd xdemo_flutter` to naviagte to the root directory of the project
3. Run `flutter doctor`. Follow any recommended prompts to fix any issues.
    * Make sure that a mobile simulator or actual device is running and connecting to Flutter. This can be confirmed with the `flutter doctor` command
4. Run `flutter run`. This will start the app on the simulator or device of choice. However, this version is not deployable to app stores. App store deployment and native package information can be found [here](https://flutter.dev/docs/deployment/flavors)

### Credentials for Login
Username: agorovoy@rs.com

Password: admin

### Application Structure

* lib/ - This folder contains all dart classes and widget definitions for the application.
* ios/ & android/ - These folder contains operating system specific bundles to run the Flutter application on either platform.
* .idea/ & build/ - These folders are automatically generatd with Flutter projects. For this application, no need to edit anything inside of them.
* pubspec.yaml - This file contains all the dependicies for the application.
* main.dart - This file is the starting point of the app. Location of the main function.


### Configuration

The demo is by default set to work with a local copy of MVIS communit edition and the default port number. If you wish to configure your MVIS server or run it on premise or in the cloud, the demo will also need to be updated. There is the a "config.js" file in the widgets folder that contains the default port number and endpoint URI. Configure these to connect the demo application with your MVIS server






