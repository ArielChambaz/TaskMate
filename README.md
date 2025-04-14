# TaskMate

TaskMate is a mobile task management application developed with Flutter. It allows users to create, edit, mark as completed, and delete tasks. Task data is stored locally using SQLite, ensuring efficient and persistent data management.

## Presentation Video

[Watch the presentation video here](https://www.youtube.com/watch?v=t_oMlu8jpHA)

## Features

- **Add Tasks**: Users can add new tasks with a title.
- **Edit Tasks**: Users can edit the title of existing tasks.
- **Mark as Completed**: Users can mark tasks as completed or incomplete.
- **Delete Tasks**: Users can delete tasks from the list.
- **Local Storage**: Tasks are stored locally in an SQLite database, enabling offline usage.

## Project Structure

- **`models/task.dart`**: Contains the `Task` data model with methods to convert objects to and from Maps for SQLite integration.
- **`database_helper.dart`**: Provides a utility class to handle CRUD (Create, Read, Update, Delete) operations on the SQLite database.
- **`screens/home_screen.dart`**: The main screen of the application where users interact with their tasks.
- **`widgets/task_card.dart`**: A custom widget to display each task in a card format.

## Technologies Used

- **Flutter**: Framework for cross-platform mobile application development.
- **Dart**: Programming language used with Flutter.
- **SQLite**: Embedded database for local task storage.
- **sqflite**: Flutter plugin for interacting with SQLite.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/ArielChambaz/TaskMate.git
   cd TaskMate
