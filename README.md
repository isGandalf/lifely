# Purpose
The purpose of this document is to demonstrate my Flutter development skills by implementing the four required features of the pre-work assessment.

# Summary
## Tasks Covered:
1. Offline-First Student Missions Screen – Intuitive UI with three demo missions targeted for kindergarten and Grade 1 students.  
2. Teacher Reward & Shopping UI – Simple replica of an e-commerce app that shows product lust with checkout feature using rewards or coins.  
3. Localized Parent Nudge Banner – Local system notifications with offline support including English and Hindi language selection.  
4. Teacher Dashboard Bar Chart Widget – Simple bar chart UI to show the progress of each class (class I to V) mission submission status.  

# Approach
## 1. Architecture:
- **Clean Architecture**: Ensured a clear separation of concerns, improving scalability and maintainability.  
- **Feature-First Design**: Structured the codebase around modular features for better organization and easier future expansion.  
- **SOLID Principles**: Followed SOLID principles to achieve robust, flexible.  

## 2. Technologies used:
- **Development kit** – Flutter, Dart  
- **State management** – BloC  
- **Packages (excl. UI elements):**  
  - Offline storage – Isar, shared_preferences  
  - Error handling – Dartz  
  - Localization – flutter_localization, intl  
  - Network – connectivity_plus  
  - Notifications – flutter_local_notifications  
- **Backend API** – mockApi.io  

# Task highlights
The tasks are categorized into **student view** and **teacher view** which can accessed by using the below mentioned test credentials. The student view covers task 1 and 3 while teachers view covers task 2 and 4.  

### Test credentials:
- **Student view** – id: `luffy` / pwd: `luffy`  
- **Teacher view** – id: `roger` / pwd: `roger`  

---

## Task 1 & 3: Offline-First Student Missions Screen & Localized Parent Nudge Banner
The student view manages three screens from bottom navigation option – **Home, Shop, Notifications**. Shop page is non-functional.  

- **On Home screen** – Only the “Missions” feature is currently active in the app.  
  - There are 3 missions fetched from mockapi.io.  
  - On the first app startup, an active internet connection is required to fetch missions from the API.  
  - Subsequent interactions with mission progress and submission follow an offline-first approach.  
  - When the internet connection is restored, local data will automatically sync with the cloud (mockapi.io), ensuring data consistency and currency.  

- **On Notifications screen** –  
  - All notifications are triggered only when the user presses the “Submit” button on the “Missions” page.  
  - Notifications are saved locally in English language by default.  
  - When the app’s language is changed, the notification UI refreshes to display in the selected language only.  

---

## Task 2 & 4: Teacher Reward & Shopping UI & Teacher Dashboard Bar Chart Widget
The teacher view manages three screens similar to student view. In teacher view, notification screen is non-functional.  

- **On Shop screen** –  
  - The product list in the shop is static and does not connect to any backend (offline or online).  
  - Reward coins are displayed in the top-right corner of the shop screen.  
  - For testing, users can reset their coin balance to 1,500 by tapping on the rewards indicator.  
  - The shop page features a floating action button that navigates to the cart.  
  - The cart displays a simple list of items added from the shop page.  
  - The checkout option becomes available only when the cart contains at least one item.  
  - Reward coins are deducted from the balance after a successful checkout, or replenished when items are removed from the cart.  
  - Product prices are shown in rewards, which can be purchased using the available reward coins.  
  - The purchase button is enabled or disabled based on the user’s current coin balance.  

- **On Home screen** – Only “Dashboard” feature is active. The dashboard will show a bar chart of learning gain (missions completed) of each class from **Class I to Class V**.  

---

# Apk link
*Apk link –*  https://drive.google.com/file/d/1NwIg4AR83BB1W8RFKd0Ofb_nU6uAvGS0/view?usp=sharing

*Demo video link –* https://drive.google.com/file/d/1xHvtrwSy2pAxrwP_OdBPgdkAHLn-wtM9/view?usp=sharing 

---

# Note
All images and UI elements are static therefore, the size of the debug apk can be larger. For release build, the app size can be reduced by 98% using flutter’s own compression method and dynamically loading of UI elements.
