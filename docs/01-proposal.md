# Proposal

<!--
The project proposal for PokéStrength Gym. Replace this with the final
version when the project is completed.
-->

## The problem, in one sentence

PokéStrength Gym aims to make workout tracking more engaging by combining exercise logging with Pokémon-inspired XP progression, trainer levels, achievements, and collectible rewards that encourage users to continue exercising.

## Who it is for

University students, gym members, beginner gym-goers, and Pokémon fans who want a more engaging way to track their workouts and fitness progress.

## Core features

- **Workout Tracker:** Record and manage exercises, track sets and repetitions, monitor workout duration, and complete training sessions.
- **Pokémon Reward System:** Collect Pokémon rewards by completing workouts. Each reward has a type, rarity, XP value, badge, and achievement.
- **Exercise Library:** Browse exercises by muscle group, including chest, arms, and legs, and add selected exercises to the active workout.
- **Trainer Profile:** View and edit trainer information, including fitness level, workout streak, total XP, and current level.
- **XP and Level Progression:** Earn XP from newly unlocked Pokémon and use it to progress through trainer levels.
- **Home Dashboard:** View trainer progress, today's active mission, and nearby Pokémon rewards.
- **Theme Support:** Use Light Mode or Dark Mode with consistent colors and reusable UI components.
- **Local Persistence:** Save trainer information, workouts, Pokémon rewards, and active exercises so the application can restore them after restarting.

## Out of scope, and why

- **Online accounts and authentication:** The current application is designed for local, single-user use and does not require a login system.
- **Online multiplayer and social features:** Features such as friends, shared workouts, leaderboards, and online gym challenges are future improvements rather than core requirements.
- **Cloud synchronization:** The current application uses local storage rather than a remote database or backend.
- **Advanced fitness analytics:** Progress charts and more detailed fitness analysis can be added after the main features are stable.
- **External Pokémon API integration:** The current Pokémon catalog is maintained locally, avoiding an external API dependency for the main reward system.

## Data the app remembers, and where it is saved

The application uses `shared_preferences` for local persistence. The data is stored locally rather than through an online backend.

- **Member (`member`):** Stores trainer information, including ID, name, age, height, weight, fitness level, workout streak, total XP, and current level.
- **Workout history (`workouts`):** Stores completed workout records, including exercise name, category, sets, repetitions, duration, calories burned, and completion date.
- **Pokémon rewards (`rewards`):** Stores collected Pokémon, including ID, name, type, XP earned, gym badge, achievement, and rarity.
- **Active exercises (`active_exercises`):** Stores exercises selected for the current workout so they can be restored when the application is reopened.

The application is intended for one local user. It does not currently provide cross-user data sharing or remote synchronization.

## Risks

- **XP and level progression:** Trainer XP must stay consistent with the XP awarded by newly unlocked Pokémon. The system must also handle level-ups correctly.
- **Saved reward consistency:** Previously saved rewards may contain older rarity or XP values. The application must update existing data when the reward rules change.
- **Duplicate rewards:** Completing multiple workouts must not add the same Pokémon repeatedly.
- **Workout completion:** A workout should not be finished prematurely while required sets remain incomplete.
- **Responsive layouts:** Reward cards, profile cards, and other widgets must fit phone-sized layouts without overflowing.
- **Theme consistency:** Text, cards, progress bars, and navigation must remain readable in both Light Mode and Dark Mode.
- **Local data privacy:** Stored trainer and workout information is not intended for highly sensitive data and should not be treated as encrypted storage.
- **Time constraints:** Optional features such as progress charts, social features, and leaderboards may exceed the available development time, so the main workout and reward flow takes priority.

## Changes since the last version

- **Initial proposal:** Established workout tracking, Pokémon rewards, an exercise library, and trainer profile management as the main features.
- **Revised proposal — September 20, 2026:** Refined the project scope and selected `shared_preferences` for local persistence.
- **Design refinement:** Developed the five-screen experience around the Home Dashboard, Active Gym Workout, Exercise Library, Rewards Vault, and Trainer Card Hub.
- **Storage and workout development:** Added local persistence for trainer information, workout records, Pokémon rewards, and exercises selected for active workouts.
- **Reward-system refinement — October 4, 2026:** Changed Pokémon rarity to follow evolution stages and set XP values according to rarity: Common, Uncommon, Rare, and Legendary.
- **Reward-data correction:** Updated the reward system to handle old saved XP values and keep stored rewards consistent with the current Pokémon catalog.
- **Current direction:** Prioritize reliable workout completion, accurate XP progression, local data persistence, and consistent Light/Dark Mode styling. Progress charts and social features remain possible future improvements.
