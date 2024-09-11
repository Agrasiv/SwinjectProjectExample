![13637225](https://github.com/user-attachments/assets/6445ff6e-d54c-4684-bee6-c46c790401df)

## Implementation features
- Dendency Injection using `Swinject`

## Architecture
This project is POC for MVVM-C pattern where:
- Model represents state and domain objects
- View is represented by `UIViewController`
- ViewModel interacts with Model and prepares data to be displayed. View uses ViewModel's data either directly or through bindings (using Delegation) to configure itself. View also notifies ViewModel about user actions like button tap.
- Coordinator is responsible for handling application flow, decides when and where to go based on events from ViewModel (using RxSwift bindings).

`View` <- `ViewController` <- bindings -> (`ViewModel` -> `Model`) <- bindings -> `Coordinator`

