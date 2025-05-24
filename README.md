# Notes App

A Flutter notes application demonstrating different approaches to state management using Cubit from flutter_bloc. The app allows users to view a list of notes, mark/unmark favorites, and view note details.

## Architecture Overview

This project explores two different approaches to Cubit injection:

### Main Branch (main)

🧱 **Purpose:** The primary branch with global Cubit injection at the root (MaterialApp) level.  
✅ **Suitable for:** Small to medium apps where Cubits are shared across multiple screens or features.  
🔁 **Key Feature:** All screens access a single shared NotesCubit instance.  

### Feature Branch (feature/local-cubit-injection)

🧪 **Purpose:** Testing local Cubit injection only in screens where needed (BlocProvider inside each route).  
✅ **Suitable for:** Modular apps where features are isolated.  
🧩 **Key Benefits:** Easier scaling, independent feature testing, and reduced global state coupling.  

## Features

- View list of notes with title and excerpt
- Mark/unmark notes as favorites
- View detailed note information
- Clean, modern UI with Material Design
- State management using Cubit/Bloc pattern
- Route-based navigation with arguments

## Getting Started

To run the app:

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

You can switch between the two approaches by checking out either the main branch or the feature/local-cubit-injection branch.

## Project Structure

```
lib/
├── app.dart               # Main app entry point
├── core/
│   ├── injection/         # Dependency injection setup
│   └── router/            # App routing configuration
└── features/
    └── notes/
        ├── data/          # Data layer (models, data sources)
        ├── domain/        # Domain layer (entities, use cases)
        └── presentation/  # Presentation layer (screens, widgets, cubit)
```

## Dependencies

- flutter_bloc: For state management
- equatable: For easier value comparison
- injectable: For dependency injection
- get_it: For service locator

## Development

The project follows a clean architecture pattern with three layers:

1. Presentation Layer: UI components and state management
2. Domain Layer: Business logic and use cases
3. Data Layer: Data access and models

## 📣 Author

**Muhammed Iqbal** – [LinkedIn](https://linkedin.com/in/iqbaltld)
