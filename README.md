Purpose:
The purpose of this document is to demonstrate my Flutter development skills by implementing the four required features of the pre-work assessment.

Summary:
Tasks Covered:
1.	Offline-First Student Missions Screen – Intuitive UI with three demo missions targeted for kindergarten and Grade 1 students. 
2.	Teacher Reward & Shopping UI – Simple replica of an e-commerce app that shows product lust with checkout feature using rewards or coins.
3.	Localized Parent Nudge Banner – Local system notifications with offline support including English and Hindi language selection.
4.	Teacher Dashboard Bar Chart Widget – Simple bar chart UI to show the progress of each class (class I to V) mission submission status.

Approach:
1.	Architecture:
a.	Clean Architecture: Ensured a clear separation of concerns, improving scalability and maintainability.
b.	Feature-First Design: Structured the codebase around modular features for better organization and easier future expansion.
c.	SOLID Principles: Followed SOLID principles to achieve robust, flexible.
2.	Technologies used:
a.	Development kit – Flutter, Dart
b.	State management – BloC
c.	Packages (excl. UI elements):
i.	Offline storage – Isar, shared_preferences 
ii.	Error handling – Dartz
iii.	Localization – flutter_localization, intl
iv.	Network – connectivity_plus
v.	Notifications – flutter_local_notifications
d.	Backend API – mockApi.io

Task highlights:
The tasks are categorized into student view and teacher view which can accessed by using the below mentioned test credentials. The student view covers task 1 and 3 while teachers view covers task 2 and 4.

Test credentials:
•	Student view – id: luffy / pwd: luffy
•	Teacher view – id: roger / pwd: roger

Task 1 & 3: Offline-First Student Missions Screen & Localized Parent Nudge Banner
The student view manages three screens from bottom navigation option – Home, Shop, Notifications. Shop page is non-functional.
-	On Home screen – Only the “Missions” feature is currently active in the app.
o	There are 3 missions fetched from mockapi.io.
o	On the first app startup, an active internet connection is required to fetch missions from the API.
o	Subsequent interactions with mission progress and submission follow an offline-first approach.
o	When the internet connection is restored, local data will automatically sync with the cloud (mockapi.io), ensuring data consistency and currency.


-	On Notifications screen – 
o	All notifications are triggered only when the user presses the “Submit” button on the “Missions” page.
o	Notifications are saved locally in English language by default.
o	When the app’s language is changed, the notification UI refreshes to display in the selected language only.

Task 2 & 4: Teacher Reward & Shopping UI & Teacher Dashboard Bar Chart Widget
The teacher view manages three screens similar to student view. In teacher view, notification screen is non-functional.
-	On Shop screen – 
o	The product list in the shop is static and does not connect to any backend (offline or online).
o	Reward coins are displayed in the top-right corner of the shop screen.
o	For testing, users can reset their coin balance to 1,500 by tapping on the rewards indicator.
o	The shop page features a floating action button that navigates to the cart.
o	The cart displays a simple list of items added from the shop page.
o	The checkout option becomes available only when the cart contains at least one item.
o	Reward coins are deducted from the balance after a successful checkout, or replenished when items are removed from the cart.
o	Product prices are shown in rewards, which can be purchased using the available reward coins.
o	The purchase button is enabled or disabled based on the user’s current coin balance.
-	On Home screen – Only “Dashboard” feature is active. The dashboard will show a bar chart of learning gain (missions completed) of each class from Class I to Class V.

Apk link – 

Note: All images and UI elements are static therefore, the size of the debug apk can be larger. For release build, the app size can be reduced by 98% using flutter’s own compression method and dynamically loading of UI elements.



