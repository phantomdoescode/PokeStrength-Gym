# AI usage

<!--
This project was built with AI assistance. This file is the record of it. It is
graded as the finals badge, and it is worth 100 points.

Start it in week 1 and keep it up as you go. The commit history of this file is
part of the evidence: a file written all at once the night before the deadline
looks exactly like what it is.
-->

## 1. How I used AI

<!--
At least six entries. One per real use. Every entry needs a commit link.
-->

### 2026-09-23 - data models and local storage

- **Tool:** ChatGPT (web chat)
- **What I asked for:** Help implementing the initial data classes and `shared_preferences` storage for the trainer/member, workouts, and Pokémon rewards.
- **What it gave back:** The initial `Member` model, data-folder structure, and `StorageService` implementation for saving and loading JSON-based application data.
- **What I kept, what I changed, and why:** I kept the JSON and `shared_preferences` approach because it matches my final project proposal: the app is a single-user application with a small amount of local data. I checked the field names against the proposal so the models would stay consistent with the documented storage plan.
- **Commit:** [`45f4a16`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/45f4a165ef337a8c885294f7dbc5dea94d9c814a), [`3ed8d6a`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/3ed8d6a329ee200d0f428c05a327cf954948337a), and [`46a01fa`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/46a01fa316734cf8e0d42678dfcb1a81ca3de114)

### 2026-09-24 - navigation and workout controller

- **Tool:** ChatGPT (web chat)
- **What I asked for:** Help removing the unnecessary login screen and connecting the main navigation with the workout controller.
- **What it gave back:** Navigation/controller changes for the five main areas of the app and the removal of the login screen so the application could go directly into the dashboard.
- **What I kept, what I changed, and why:** I kept the controller-based approach because it fits the project structure and keeps navigation/workout state outside the screen widgets. I removed the login flow because the final proposal describes the project as a single-user local application rather than an authenticated service.
- **Commit:** [`1af1d0e`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/1af1d0ef9b6b9eb1941906a6005f09f61c243836)

### 2026-09-25 - rewards and trainer controllers

- **Tool:** ChatGPT (web chat)
- **What I asked for:** Help building the initial rewards and trainer controllers so the app could load trainer information and Pokémon rewards and connect them to the rest of the application.
- **What it gave back:** Initial `RewardsController` and `TrainerController` logic for loading local data, managing rewards, and exposing trainer progress to the UI.
- **What I kept, what I changed, and why:** I kept the controller separation because it makes the screens mostly responsible for presentation while the controllers handle state changes. I later changed parts of the reward logic as the Pokémon progression rules became more specific.
- **Commit:** [`444c476`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/444c476300a0e07bc92975ef97166ad57f2d8e8a)

### 2026-09-28 - Flutter web deployment

- **Tool:** Claude (web chat)
- **What I asked for:** Help getting the Flutter project ready to open as a web application and deploy through GitHub Actions, while keeping the live demo documented in the README.
- **What it gave back:** A GitHub Actions workflow for Flutter web deployment and README updates for the live demo link and security section.
- **What I kept, what I changed, and why:** I kept the workflow because it gives the project a repeatable deployment process. I checked the repository paths and README links because deployment only helps if the resulting site and documentation point to the correct project location.
- **Commit:** [`b7e2382`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/b7e2382b2ad425327c492feb02849c93bdd0f362)

### 2026-09-30 - Pokémon catalog and reward card layout

- **Tool:** ChatGPT (web chat)
- **What I asked for:** Help adding the 151-Pokémon catalog and revising the reward cards and Home Dashboard so the implemented screens were closer to the final mockup.
- **What it gave back:** A large Pokémon data file, revised reward-card layout, and Home Dashboard changes that connected the collected rewards to the interface.
- **What I kept, what I changed, and why:** I kept the catalog-driven approach because it makes the reward system easier to expand to all 151 Pokémon. I changed several layout, sizing, spacing, and reward details after testing because the generated version did not always match my mockup or behave correctly on smaller layouts.
- **Commit:** [`6844d5a`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/6844d5a157c10f3bf06f4d9f84e629fbc13bd177) and [`6a01fa0`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/6a01fa0ea696c1c81f849fc8c73e614f84220339)

## 2. Where the AI got it wrong

### Case 1 - theme and main app naming mismatch

- **What it gave me:** A `main.dart` setup that used theme property names that did not match the actual `AppTheme` implementation in my project.
- **What was wrong with it:** The generated `main.dart` and theme file were not using the same names, so the application did not compile until I corrected the references.
- **What I did instead:** I checked both files together and changed the references to the actual `lightTheme` and `darkTheme` definitions I was using, then tested the application again.
- **Commit:** [`fb2ee1f`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/fb2ee1f98a56c52ab77ca8dc41ca63109a0bd9e7)

### Case 2 - reward card overflow

- **What it gave me:** A reward-card layout that used fixed vertical sizing and spacing assumptions from the mockup.
- **What was wrong with it:** The card content could not fit inside the fixed height on smaller layouts, which caused the bottom overflow I saw while testing the Rewards screen.
- **What I did instead:** I removed the unnecessary fixed-height assumptions, tightened the internal layout, and changed the Rewards screen layout so the cards could size to their content instead of being forced into a fixed tile height.
- **Commit:** [`c81d3ee`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/c81d3ee87c3db0ef2f611d7f197b95d1cfec5821)

### Case 3 - Pokémon rarity and XP logic

- **What it gave me:** An initial Pokémon reward system that assigned rarity using Pokédex-number patterns and calculated XP from the Pokémon number.
- **What was wrong with it:** That did not match the rule I wanted for the project. A Pokémon's rarity needed to follow its evolution stage, and XP needed to be fixed by rarity rather than by its Pokédex number. It also left the starter Pokémon using the old mockup XP values.
- **What I did instead:** I replaced the old rarity/XP logic with explicit evolution-stage sets and fixed rewards of Common = 100 XP, Uncommon = 200 XP, Rare = 500 XP, and Legendary = 1000 XP. I also updated the saved starter rewards so Pikachu, Squirtle, Charmander, and Machop use 100 XP each.
- **Commit:** [`c81d3ee`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/c81d3ee87c3db0ef2f611d7f197b95d1cfec5821)

## 3. Who wrote what

### Written by me

#### Reward Card and UI adjustments

- **File:** `lib/widgets/reward_card.dart`
- **Commit:** [`c81d3ee`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/c81d3ee87c3db0ef2f611d7f197b95d1cfec5821)
- **What it does and why it is built this way:** I worked directly on the reward-card layout and adjusted its spacing, sizing, type presentation, and dark-mode behavior while testing it against the final mockup. I kept it as a reusable widget because the same component appears on the Home Dashboard and Rewards Vault. I also corrected the layout after testing exposed overflow problems.

#### Pokémon reward rules

- **File:** `lib/data/pokemon_catalog.dart`
- **Commit:** [`c81d3ee`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/c81d3ee87c3db0ef2f611d7f197b95d1cfec5821)
- **What it does and why it is built this way:** I defined the reward rules I wanted the application to follow: pre-evolutions are Common, middle evolutions are Uncommon, final evolutions and non-evolving Pokémon are Rare, and Legendary Pokémon stay Legendary. XP is then determined from that rarity so the reward value is consistent instead of being tied to the Pokédex number.

### The AI-written part I understand best

#### Storage and controller structure

- **File:** `lib/services/storage_service.dart`, `lib/controllers/rewards_controller.dart`, and `lib/controllers/trainer_controller.dart`
- **Commit:** [`46a01fa`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/46a01fa316734cf8e0d42678dfcb1a81ca3de114) and [`444c476`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/444c476300a0e07bc92975ef97166ad57f2d8e8a)
- **What it does and why I kept it:** These parts handle the application's saved state instead of making each screen manage storage itself. `shared_preferences` stores the small amount of JSON data the app needs, while the controllers load that data and expose it to the screens. I understand this part best because it follows the single-user/local-storage decision from my project proposal and keeps the UI code simpler.

#### Web deployment workflow

- **File:** `.github/workflows/` Flutter web deployment workflow
- **Commit:** [`b7e2382`](https://github.com/phantomdoescode/PokeStrength-Gym/commit/b7e2382b2ad425327c492feb02849c93bdd0f362)
- **What it does and why I kept it:** The workflow builds the Flutter web project and supports deployment through GitHub Actions. I kept it because the final project is meant to be reachable through a browser, and having the deployment process in the repository makes the web demo repeatable.
