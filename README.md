# **Quote Vault**

Quote Vault is a Flutter application for browsing, saving, and sharing inspirational quotes.
The app is built using **MVVM architecture**, **Supabase backend**, and environment-based configuration using `.env`.
Authentication, quote fetching, and navigation are fully implemented.

---

## **✨ Features Implemented**

### **Authentication**

* ✅ Login with email & password
* ✅ Sign up with email & password
* ✅ Forgot password (reset email flow)
* ✅ Logout functionality
* ✅ Session persistence using Supabase Auth

### **Quotes**

* ✅ Quotes stored in Supabase `quotes` table
* ✅ Quotes fetched and displayed on Home screen
* ✅ Pull-to-refresh support

### **Navigation**

* ✅ Bottom navigation bar (Home, Explore, Library, Profile)
* ✅ AuthGate to switch between Login and Main app
* ⚠️ Known issue: content in one section is not rendering due to bottom navigation layout conflict (see Limitations)

---

## **🧱 Architecture**

* **MVVM (Model–View–ViewModel)**
* Clear separation of:

  * UI (Views)
  * Business logic (ViewModels)
  * Data access (Repositories / Supabase service)
* State management using **Provider**

---

## **📂 Project Structure**

lib/
├── main.dart
│
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_routes.dart
│   │   └── app_strings.dart
│   │
│   ├── services/
│   │   └── supabase_service.dart
│   │
│   ├── theme/
│   │   └── app_theme.dart
│   │
│   ├── utils/
│   │   └── validators.dart
│   │
│   └── widgets/
│       ├── home_bottom_nav.dart
│       ├── loading_widget.dart
│       ├── main_nav.dart
│       └── section_title.dart
│
├── features/
│   │
│   ├── auth/
│   │   ├── model/
│   │   │   └── user_model.dart
│   │   │
│   │   ├── repository/
│   │   │   └── auth_repository.dart
│   │   │
│   │   ├── view/
│   │   │   ├── login_view.dart
│   │   │   ├── signup_view.dart
│   │   │   └── reset_password_view.dart
│   │   │
│   │   ├── viewmodel/
│   │   │   └── auth_view_model.dart
│   │   │
│   │   └── widgets/
│   │       ├── app_text_field.dart
│   │       ├── primary_button.dart
│   │       ├── auth_footer.dart
│   │       └── auth_gate.dart
│   │
│   ├── home/
│   │   ├── model/
│   │   │   └── quote.dart
│   │   │
│   │   ├── repository/
│   │   │   └── home_repository.dart
│   │   │
│   │   ├── view/
│   │   │   └── screens/
│   │   │       └── home_view.dart
│   │   │
│   │   ├── viewmodel/
│   │   │   ├── home_view_model.dart
│   │   │   └── navigation_view_model.dart
│   │   │
│   │   └── widgets/
│   │       ├── category_chips.dart
│   │       ├── discover_header.dart
│   │       ├── quote_of_day_card.dart
│   │       └── quote_card.dart
│   │
│   ├── explore/
│   │   └── view/
│   │       └── explore_view.dart
│   │
│   ├── library/
│   │   └── view/
│   │       └── library_view.dart
│   │
│   └── profile/
│       └── view/
│           └── profile_view.dart
│
├── .env   (NOT committed)
└── pubspec.yaml

---

## **⚙️ Setup Instructions**

### **1. Clone the Repository**

```bash
git clone https://github.com/yourusername/quote-vault.git
cd quote-vault
```

### **2. Install Dependencies**

```bash
flutter pub get
```

### **3. Supabase Setup**

1. Go to [https://supabase.com](https://supabase.com) and create a project

2. Enable **Email / Password Authentication**

3. Create a table named `quotes`
   Example columns:

id            uuid (PK)
text          text
author        text
category      text
is_featured   boolean
featured_date date   
created_at    timestamp


4. Insert sample quotes into the `quotes` table

---

### **4. Environment Configuration (`.env`)**

Create a `.env` file in the project root:

```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-anon-key
```

⚠️ **Important**

* `.env` is added to `.gitignore`
* Supabase URL and API key are **not committed to GitHub**

The app loads environment variables using `flutter_dotenv`.

---

### **5. Run the App**

```bash
flutter run
```

## **🤖 AI Coding Approach & Workflow**

### **AI Tools Used**

* ChatGPT

### **How AI Was Used**

* Generating MVVM boilerplate for auth and navigation
* Refactoring widget trees
* Debugging Provider, Navigator, and Scaffold issues
* Improving Supabase queries and error handling

### **Example Prompts**

* “Create Flutter MVVM login and signup flow using Supabase”
* “Fix bottom navigation bar not showing content in Flutter”
* “Explain why nested Scaffold hides bottom navigation”

AI-generated code was **reviewed, tested, and manually refined**.

---

## **📹 Loom Video Walkthrough (8–10 minutes)**

### **1. App Demo (3–4 min)**

* Login / Signup / Forgot password
* Logout
* Quote list from Supabase
* Bottom navigation flow

### **2. Design Process (2 min)**

* Stitch / Figma workflow
* UI implementation in Flutter

### **3. AI Workflow (3–4 min)**

* Development setup
* Effective prompts
* Debugging with AI
* Lessons learned

🔗 **App Demo Link:**
[link](https://drive.google.com/file/d/17zClHGpE641sK_ynkBwzJ-E6zCui1WLv/view?usp=drive_link)
Note: Video is hosted on Google Drive due to Loom upload limitations.
---

## **⚠️ Known Limitations**

* One bottom navigation section content is **not visible** due to layout/scaffold conflict
* Bottom navigation refactor in progress to resolve content rendering issue
* TestFlight (iOS) build not submitted yet

## **✅ Summary**

* Auth (Login, Signup, Forgot Password, Logout): **Working**
* Supabase integration: **Working**
* Quotes fetched & displayed: **Working**
* Bottom navigation: **Implemented**
* Environment-based API configuration: **Implemented via `.env`**

---


