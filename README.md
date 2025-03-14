# abhishek_jain_kgk_diamonds

# Bloc Flutter Assessment Task by Abhishek Jain

A diamond shopping app built in flutter, supports android and ios. This project uses the **BLoC (Business Logic Component)** pattern for state management. Each feature (e.g., Cart, Home) has its own BLoC folder where the logic for managing state is defined.

## Project Structure
lib/
├── common/
├── data/
├── features/
│   ├── cart/
│   │   ├── bloc/
│   │   └── ui/
│   └── home/
│       ├── bloc/
│       └── ui/
├── services/
├── models/
└── main.dart

## Directory Breakdown

    common/: This folder contains shared resources such as common widgets used app wide.This can also contain constants, colors, enums.

    data/: This folder is responsible for data management, including data sources..

    features/: This folder contains the main features of the application. Each feature has its own subfolder, which includes:
        cart/: Contains the BLoC and UI components related to the shopping cart functionality.
        home/: Contains the BLoC and UI components related to the home screen of the application.

    services/: This folder includes services that provide functionality such as API calls.  It handles the interaction with the Hive database serivce.

    models/: This folder contains data models that represent the structure of the data used in the application.

    main.dart: The entry point of the application, where the app is initialized and run.

## State Management
This project uses the BLoC (Business Logic Component) pattern for state management. BLoC helps to separate the presentation layer from the business logic, making the code more modular and testable. Each feature (e.g., cart and home) has its own BLoC folder, which contains the necessary BLoC classes to manage the state and events for that feature.

#### BLoC Structure

    Events: Define the actions that can occur in the feature (e.g., adding an item to the cart).
    States: Define the different states that the UI can be in (e.g., loading, loaded, error).
    BLoC: Contains the logic to map events to states and manage the flow of data.

## Persistent Storage

For persistent storage, this project utilizes the Hive database. Hive is a lightweight and fast key-value database that is easy to use and integrates seamlessly with Flutter.

#### CRUD Operations: 

Implement create, read, update, and delete operations in the data layer to interact with the Hive database.

## Project Dependencies
    cupertino_icons: ^1.0.8
    flutter_bloc: ^9.1.0
    equatable: ^2.0.7
    hive_flutter: ^1.1.0

## Run Commands:
    flutter clean
    flutter pub get
    flutter run
