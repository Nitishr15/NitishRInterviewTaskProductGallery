# Flutter Clean Architecture Product List App

This Flutter application follows the Clean Architecture principles and utilizes the Bloc pattern for state management. The app fetches product list from mock API and display it on listview.

## Architecture Overview

The project follows the Clean Architecture principles, separating the app into different layers:

- **Presentation Layer**: Contains the Flutter widgets, Blocs, and UI-related logic.
- **Domain Layer**: Contains business logic and use cases.
- **Data Layer**: Manages data sources such as APIs and local databases.

## State Management

The app uses the Bloc pattern for state management. Blocs are responsible for managing the application's state and business logic.

## API Requests

We have used [MockAPI](https://mocki.io) for product details.

## Dart Object Comparison

The `equatable` package is employed for efficient comparison of Dart objects. This is particularly useful when working with Blocs and state changes.

### System Requirements

Dart SDK Version 3.4.3 or greater.
Flutter SDK Version 3.22.2 or greater.

### Project Structure

```
.
├── android                         - contains files and folders required for running the application on an Android operating 
                                      system.
├── assets                          - contains all images and fonts of your application.
├── ios                             - contains files required by the application to run the dart code on iOS platforms.
├── lib                             - Most important folder in the project, used to write most of the Dart code.
    ├── main.dart                   - starting point of the application
    ├── core
    │   └── utils                   - contains common files and utilities of project
    ├── data
    │   ├── models                  - extension of the entities, so we will let our model class to extend our entity 
    │   ├── repositories            - contains implimentation of the repos in the domain layer 
    │   └── sources                 - works with external resources to fetch data
    ├── domain
    │   ├── entities                - contains blue print of data model which will pass around for a certain features or     
                                      screens or pages 
    │   ├── repositories            - contains abstract classes or interfaces 
    │   └── usecases                - contains tunnel between presentation and domain layer to communicate.
    ├── presentation                - contains all screens and screen controllers
    │   ├── bloc                    - contains your state, event and bloc. They are at the heart of the state management
    │   │   ├── cart                - contains cart state, event and bloc
    │   │   └── products            - contains product state, event and bloc
    │   ├── screens                 - contains pages 
    └── ─── widgets                 - contains all custom widget classes
```


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/Nitishr15/NitishRInterviewTaskProductGallery.git
```
**Step 2:**

```
 cd NitishRInterviewTaskProductGallery
```

**Step 3:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```
**Step 4:**

Run the app

```
flutter run
```
