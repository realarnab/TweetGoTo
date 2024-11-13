# TweetGoTo

TweetGoTo is a web application that allows users to schedule, manage, and publish tweets to their Twitter accounts. It integrates with the Twitter API to provide seamless access and interaction with users' Twitter accounts, enabling scheduled posts to be sent automatically.

## Features

### 1. **User Authentication**
   - **Sign Up and Login**: Users can create an account and log in securely using their email and password.
   - **Password Reset**: A secure password reset flow is available where users can request a password reset link to their registered email.
   - **OAuth Integration with Twitter**: Users can connect their Twitter accounts using OAuth authentication to schedule and post tweets directly from the platform.

### 2. **Twitter Account Management**
   - **Connect Twitter Account**: Users can connect their Twitter account via OAuth and allow the application to access their Twitter account for tweet scheduling.
   - **View Connected Accounts**: Users can view their connected Twitter accounts and disconnect them if necessary.

### 3. **Tweet Scheduling**
   - **Schedule Tweets**: Users can compose and schedule tweets to be published at a later time.
   - **View Scheduled Tweets**: Users can view their scheduled tweets and edit or delete them as needed.

### 4. **Tweet Publishing**
   - **Auto-publish Tweets**: The application automatically publishes tweets at the scheduled time using the Sidekiq job queue.
   - **Manual Tweeting**: Users can post tweets manually at any time, which will be sent immediately.

### 5. **Notifications**
   - **Password Reset Notifications**: Users are notified via email when they request a password reset.
   - **Tweet Success Notification**: After successfully publishing a tweet, users are notified.

### 6. **Responsive UI**
   - **Modern UI**: The application features a user-friendly, responsive design built with Bootstrap.
   - **Error Handling**: The app provides helpful error messages and handles edge cases like invalid tokens and expired sessions gracefully.

## Enhancements Made

### 1. **Password Reset Flow**
   - Implemented a secure password reset flow using signed tokens.
   - Users can reset their password securely through email links, ensuring that only the user with access to the email can change the password.

### 2. **OAuth Integration**
   - Integrated Twitter OAuth authentication to allow users to securely connect their Twitter account with the application.
   - This enhancement enables users to tweet directly from the platform without needing to manually enter their Twitter credentials.

### 3. **Background Job with Sidekiq**
   - Integrated Sidekiq for handling background tasks such as tweet scheduling and publishing.
   - This ensures that tweets are sent at the correct scheduled time without blocking the main application flow.

### 4. **Enhanced Error Handling**
   - Improved error handling for expired or invalid password reset tokens.
   - Added validation and error messages to ensure the user experience is smooth and clear.

### 5. **UI/UX Improvements**
   - Optimized the user interface for better usability, with an easy-to-navigate layout and user-friendly design.
   - Bootstrap was incorporated to ensure the application is responsive and works well across devices.

### 6. **Security Enhancements**
   - Password reset tokens are signed and have expiration times to prevent unauthorized password changes.
   - Enhanced authentication methods to secure user data and ensure privacy.

## Technologies Used

- **Ruby on Rails**: Web framework used to build the application.
- **Bootstrap**: Frontend framework used to build the responsive UI.
- **Sidekiq**: Background job processor for handling scheduled tasks like tweet publishing.
- **Twitter API**: Used to interact with the Twitter platform for publishing tweets.
- **Redis**: Used as the data store for Sidekiq to manage background jobs.
- **PostgreSQL**: Relational database used to store user and tweet data.


