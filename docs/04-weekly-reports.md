# Weekly Reports

## Week 1 (September 14–20, 2026)

**Done this week**
- Added the initial project files to the GitHub repository to establish an organized Flutter application.
- Finalized the project structure by separating the application into `controllers`, `data`, `screens`, `services`, `theme`, and `widgets` folders.
- Organized the code using an MVC-inspired structure to separate data models, application logic, reusable components, and interface screens.
- Added Dark Mode to support both Light and Dark visual schemes.
- Finalized the storage approach using `shared_preferences` for the trainer profile, workout records, and Pokémon reward data.

**In progress**
- Started modifying and developing `main.dart`, `app_theme.dart`, `member.dart`, `workout.dart`, `pokemon_reward.dart`, and `storage_service.dart`.
- Started developing the Splash Screen, including the initial loading flow for preparing the application before displaying the appropriate screen.
- Continued working on the data models and storage service to prepare them for integration with the controllers and screens.

**Blocked or stuck on**
- Encountered difficulties working with files in the `data` and `services` folders, particularly understanding how data models connect with the storage system.
- Had difficulty understanding how `shared_preferences` stores structured information and how objects need to be converted into JSON-compatible data before being saved.
- Needed to understand how saved JSON data is converted back into Dart objects when loading information.
- Was unsure whether a Login Screen should be included because PokéStrength Gym is designed as a single-user application without online authentication.
- The Login Screen decision also affected the Splash Screen flow because it was necessary to determine whether the application should proceed directly to the Home Dashboard or display a profile setup screen for a new user.
- Some of the initial implementation took longer because I was still becoming familiar with the relationship between data models, the storage service, and controllers.

**Decisions made, and why**
- Organized the project into separate folders for controllers, data, screens, services, themes, and widgets to make the code easier to maintain as the application grows.
- Added Dark Mode to complete the revised design system and support different visual preferences.
- Chose `shared_preferences` for local persistence because the application needs to preserve trainer information, workout progress, XP, and Pokémon rewards after it is closed.
- Started developing a Splash Screen to provide a proper entry point and prepare the application to load saved data before displaying the main interface.
- Left the Login Screen decision open during this week and evaluated whether authentication was necessary for the application's single-user design.

**Hours spent, roughly:** 10–12 hours.

**Next week I will:**
- Finish the remaining controller classes and connect them to the corresponding data models and storage services.
- Complete the reusable widgets based on the finalized design system.
- Finish the Splash Screen and finalize the application's startup flow.
- Finalize the main application screens, including the Home Dashboard, Active Gym Workout, Exercise Library, Rewards Vault, and Trainer Card Hub.
- Connect the screens, controllers, and storage system so trainer information, workout progress, XP, and Pokémon rewards work together.
- Test the application flow and fix any remaining errors before moving to the next development increment.

---

## Week 2 (September 21–27, 2026)

**Done this week**
- Finished the initial files for the `services`, `controllers`, `widgets`, and `screens` folders.
- Removed the Login Screen because PokéStrength Gym is designed as a single-user application and does not currently require online authentication.
- Finished the Splash Screen and updated the application startup flow to proceed directly to the Home Dashboard.
- Continued connecting the controllers, data models, storage service, widgets, and screens to establish the main application flow.
- Continued implementing the main screens and reusable components based on the finalized design system and mockup.

**In progress**
- Connecting the controllers, data models, storage service, widgets, and screens so that the application's features work together.
- Refining the Home Dashboard, Active Gym Workout, Exercise Library, Rewards Vault, and Trainer Card Hub.
- Adjusting reusable widgets and screen layouts to maintain consistency with the design system and mockup.

**Blocked or stuck on**
- Some reusable widgets and screens required adjustments to work correctly with the existing controllers, data models, and storage system.
- Encountered difficulties with certain functions and connections between different parts of the application.
- Understanding how widgets and screens should interact with controllers while keeping the interface consistent with the mockup took most of the development time.

**Decisions made, and why**
- Removed the Login Screen because the current version is a single-user application and does not require online authentication.
- Updated the Splash Screen to proceed directly to the Home Dashboard, simplifying the application's startup flow.
- Continued using an MVC-inspired project structure to separate data models, application logic, reusable widgets, and interface screens.
- Continued using `shared_preferences` for local persistence so trainer information, workout records, XP, and Pokémon rewards can be saved between sessions.

**Hours spent, roughly:** 17–18 hours.

**Next week I will:**
- Fix and refine the remaining code functions.
- Correct any errors in the connections between controllers, widgets, screens, and the storage system.
- Continue testing the application flow and make sure the main features work correctly.
- Finalize the behavior and functionality of the Home Dashboard, Active Gym Workout, Exercise Library, Rewards Vault, and Trainer Card Hub.
