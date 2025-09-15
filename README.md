# SwiftUI + Firebase Auth (Practice)

SwiftUI + Firebase Auth practice app: **Create Account** & **Sign In/Out** with session persistence, a Firestore-backed user profile, and clean **MVVM** using the **Observation** framework (`@Observable`) and **async/await**.

> **Validation:** email contains “@”; password ≥ 6 characters; confirm password must match.

---

## Features
- Email/password **Sign Up** & **Sign In/Out**
- **Session persistence** (Profile when logged in, Login otherwise)
- Firestore **Users** collection (document id = Firebase UID) ↔️ `User` model
- Profile view with initials via `PersonNameComponentsFormatter`
- Reusable input components; simple, extendable MVVM structure

## Tech Stack
- **SwiftUI**, **Swift 5.9+**
- **FirebaseAuth**, **FirebaseFirestore** (Swift Package Manager)
- **MVVM** with `@Observable` (Observation), `@MainActor`, **async/await**

---

## Screenshots 

> 30–45s flow: Create Account → Profile → Sign Out → Sign In
<img width="1470" height="956" alt="Screenshot 2025-09-15 at 01 39 05" src="https://github.com/user-attachments/assets/6089862b-35eb-47ef-9cca-d25ec2d4c238" />
<img width="1470" height="956" alt="Screenshot 2025-09-15 at 01 39 53" src="https://github.com/user-attachments/assets/a25e25f9-301f-46b9-855e-4ba4f51a91d9" />
<img width="1470" height="956" alt="Screenshot 2025-09-15 at 01 38 14" src="https://github.com/user-attachments/assets/a35d3f37-dfd2-44a3-b882-58bddfd254f4" />



