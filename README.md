# PokéStrength Gym

> For university students, gym members, and Pokémon fans looking for a more engaging way to track workouts through XP progression, achievements, and collectible rewards.

- **Live demo:** https://YOURUSERNAME.github.io/YOUR-REPO/ <!-- GitHub Pages is set up already; replace if you host elsewhere -->
- **Demo video:** `docs/demo.mp4` (link it here once it exists)
- **Course:** Applications Development and Emerging Technologies (6ADET), Holy Angel University
- **Author:** Kayama, Masaharu (phantomdoescode)

## Project Structure

```yaml
PokeStrength-Gym/
├── docs/ # proposal, mockups, weekly reports, screenshots
├── lib/ # app source code
│   ├── controllers/ # state and logic (MVC controller)
│   ├── data/ # plain data classes (MVC model)
│   ├── screens/ # full-page views (MVC view)
│   ├── services/ # local storage and supporting services
│   ├── theme/ # design tokens, shared styling
│   ├── widgets/ # reusable multi-widget components
│   └── main.dart # app entry point
├── web/ # web platform target
├── AI-USAGE.md # AI usage log
├── README.md # this file
└── pubspec.yaml # dependencies
```

---

## Screenshots

```markdown
| Home | Detail | Add |
| --- | --- | --- |
| ![Home](docs/assets/screen-home.png) | ![Detail](docs/assets/screen-detail.png) | ![Add](docs/assets/screen-add.png) |
```

## What it does

- The user can track workouts by recording exercises, categories, sets, repetitions, duration, calories burned, and completion dates.
- The user can earn Pokémon-inspired rewards through XP, levels, Pokémon companions, gym badges, achievements, and rarity.
- The user can browse and search the exercise library by muscle group.
- The user can view their trainer level, XP, workout streak, total workouts, and Pokémon collection.
- The user can finish workouts and progress toward rewards through the connection between workout completion and the Rewards Vault.

## How to use it

1. Home screen. View trainer progress, today's active mission, nearby rewards, and start a workout. The bottom navigation provides access to Home, Workout, Library, Rewards, and Profile.
2. Active Gym Workout. Follow the listed exercises, track training time, and resume or finish the current workout. Finishing the workout leads to the Rewards Vault to claim gym badges and rewards.
3. Library. Search for exercises and browse exercises by muscle group.
4. Rewards Vault. View collected Pokémon companions and earned gym badges. Pokémon reward cards and badges can be opened to view their details.
5. Trainer Card Hub. View trainer level, XP, workout streak, total workouts, and Pokémon collection. Use Edit Trainer Card to update the trainer profile.

## Built with

| | |
| --- | --- |
| Framework | Flutter (Dart) |
| State | `setState` and controller classes |
| Storage | `shared_preferences` |
| Other packages | `device_preview` for phone-sized development previews; `fl_chart` for planned workout and XP progress charts |

## Running it yourself

```bash
git clone https://github.com/phantomdoescode/PokeStrength-Gym
flutter pub get
flutter run -d web-server --web-port 8080
```

Then open http://localhost:8080. Requires Flutter and Dart. The application is intended to run as a Flutter web application and can be checked using a phone-sized layout with device_preview.

### Environment variables

This project currently does not use environment variables. No API keys, passwords, authentication tokens, or other secrets are required for the MVP.

## Privacy and secrets

- The app is designed as a single-user application and stores the member profile, workout history, XP, level, workout streak, and Pokémon rewards locally using shared_preferences.
- The current MVP does not require a remote database or API service. Passwords, API keys, authentication tokens, private keys, and real personal information should not be committed to the public repository.
- The stored data uses the member, workouts, and rewards keys in local storage.

## Project documentation

| Document | |
| --- | --- |
| [Proposal](docs/01-proposal.md) | the problem, the users, the scope |
| [Mockup and wireframes](docs/02-mockup.md) | what it looks like, and the screen flow |
| [Design system](docs/03-design-system.md) | colors, type, spacing, components |
| [Weekly reports](docs/04-weekly-reports.md) | what happened each week |
| [Demo video](docs/05-demo-video.md) | the recording and what it shows |
| [Start here](START-HERE.md) | how this repo works (delete once you have read it) |
| [Security and privacy](docs/06-security-and-privacy.md) | the checklist, filled in |

## Status and what is next

The current MVP focuses on the workout tracker, Pokémon reward system, exercise library, and trainer profile. The five main screens and their navigation flow have been defined properly, while the design system includes both light and dark themes.

Future improvements may include Pokémon Gym Challenges, leaderboards and monthly challenges, a friend system, daily Pokémon missions, workout sharing, and progress charts. The main development concern is keeping XP progression balanced without making rewards too easy or repetitive.

## Credits

- Packages: see [`pubspec.yaml`](./pubspec.yaml)
- Assets, icons, 3D models, sounds: (tentative)
- People who helped: (tentative)

## AI use

![Built with AI assistance](https://img.shields.io/badge/built%20with-AI%20assistance-0b5fff)

AI tools were used to assist with project structure, Flutter development, code refinement, documentation, and troubleshooting. The project is still developed and reviewed by the author. See [`AI-USAGE.md`](./AI-USAGE.md), where the full account lives.

## Licence

MIT, see [LICENSE](LICENSE). Change it if you want different terms.
