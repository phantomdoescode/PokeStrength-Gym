# Security and privacy

This document records the security and privacy design of PokéStrength Gym. This is a public repository.

**Last checked:** 2026-10-09

## What this app stores

| Data | Where it lives | Who can see it |
|---|---|---|
| Trainer profile, including name, age, height, weight, and fitness level | Locally through `shared_preferences`, under `member` | Anyone with access to the device, browser profile, or its local application data |
| Workout history, including exercises, sets, repetitions, duration, and calories | Locally through `shared_preferences`, under `workouts` | Anyone with access to the device, browser profile, or its local application data |
| Pokémon rewards, including name, type, rarity, XP, badge, and achievement | Locally through `shared_preferences`, under `rewards` | Anyone with access to the device, browser profile, or its local application data |
| Exercises selected for the active workout | Locally through `shared_preferences`, under `active_exercises` | Anyone with access to the device, browser profile, or its local application data |

PokéStrength Gym is designed as a single-user application. The current implementation does not require users to create an online account or share their profile with other users.

Local storage is not the same as encrypted storage. Someone who can access the device or its browser data may be able to access or remove the saved application data.

## Secrets

- **Values the app needs at runtime:** The current features do not require API keys, authentication tokens, passwords, or other private configuration.
- **Where secrets live locally:** No `.env` file is required by the current implementation. If private configuration is introduced in the future, it must not be committed to the public repository.
- **Deployment configuration:** The application is intended to run as a Flutter web app. Review the GitHub Actions workflow and repository settings before release to confirm that deployment does not expose private credentials.
- **Information in the web build:** The deployed build contains the compiled Flutter web application. No API credentials should be embedded in the build.
- **Sample data:** Use generic sample trainer information during development and demonstrations. Do not include real personal information unnecessarily in source code, screenshots, or documentation.

## What protects the data on the service side

The current application uses local persistence and does not require an online backend for its core features.

There is no remote member database or server-side account system in the current design. Therefore, backend access rules and database row-level security are not part of the current implementation.

The privacy limitation is that locally stored profile and workout data is available to someone who gains access to the same browser profile or device data.

## Checklist

- [x] The current application features do not require an API key or other private runtime configuration.
- [x] Trainer, workout, reward, and active exercise data are designed to be stored locally.
- [x] The application does not require a remote database to provide its core functionality.
- [x] The current reward catalog can operate without an external Pokémon API.
- [x] Sample trainer information should be used instead of real personal information during demonstrations.
- [x] Confirm that any `.env` or private configuration file is ignored by Git if one is introduced later.
- [x] Review GitHub Actions permissions and workflow configuration before final deployment.
- [x] Confirm that screenshots and demonstration data do not expose personal profile information.

## Known issues

### Local storage is not encrypted

The app uses `shared_preferences` for small amounts of local data. This is suitable for the current single-user project, but it should not be treated as a secure vault for sensitive personal information.

### Clearing browser data can remove saved progress

Because the application stores data locally, clearing the browser's site data or application storage may remove saved trainer information, workouts, and Pokémon rewards.

### No cloud backup or synchronization

The current app does not synchronize user information across devices. A user who opens the application in a different browser or on another device should not expect their previous local progress to be available automatically.

### Future improvements

If the project later introduces user accounts, cloud synchronization, leaderboards, or social features, the security design will need to be updated to cover authentication, authorization, remote data storage, and secure communication.

## Review status

This document describes the current application design. Complete the unchecked repository and deployment checks before treating the security review as finished.
