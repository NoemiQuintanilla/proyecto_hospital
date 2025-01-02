# Flutter Medicine App

This Flutter application is designed to manage and display medicines categorized by their respective categories using an SQLite database.

## Project Structure

```
flutter_medicine_app
├── lib
│   ├── main.dart                # Entry point of the application
│   ├── models
│   │   ├── category.dart        # Defines the Category class
│   │   └── medicine.dart        # Defines the Medicine class
│   ├── screens
│   │   ├── category_screen.dart  # Displays a list of categories
│   │   └── medicine_screen.dart  # Displays medicines filtered by category
│   ├── services
│   │   └── database_helper.dart  # Manages SQLite database operations
│   ├── widgets
│   │   └── medicine_card.dart     # Widget for displaying medicine details
├── pubspec.yaml                  # Project configuration and dependencies
└── README.md                     # Project documentation
```

## Features

- **Category Management**: Users can view and select categories of medicines.
- **Medicine Display**: Upon selecting a category, users can view medicines associated with that category.
- **SQLite Database**: The app uses SQLite for persistent storage of categories and medicines.

## Setup Instructions

1. Clone the repository:
   ```
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```
   cd flutter_medicine_app
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the application:
   ```
   flutter run
   ```

## Dependencies

- `sqflite`: For SQLite database management.
- Other necessary packages as specified in `pubspec.yaml`.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.