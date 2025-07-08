# Web Stripe

A professional Flutter web application for integrating Stripe payments seamlessly into your web projects.

## Features

- **Stripe Payment Integration:** Securely accept payments using Stripe's Payment Intents API.
- **Modern UI:** Clean, responsive, and user-friendly payment dialog.
- **WebView Payment Flow:** Uses a custom HTML Stripe payment page for a smooth checkout experience.
- **Status Verification:** Confirms payment status after completion.
- **Cross-Platform Ready:** Built with Flutter, supporting web and other platforms.

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A Stripe account ([Sign up here](https://dashboard.stripe.com/register))
- Stripe API keys (publishable and secret)

### Setup
1. **Clone the repository:**
   ```sh
   git clone https://github.com/MuhammadUsamaProgrammer/flutter_web_stripe.git
   cd web_stripe
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Configure Stripe Keys:**
   - Open `lib/web_strip_service.dart`.
   - Replace `your_secret_key_here` and `your_publishable_key_here` with your actual Stripe keys.
   - Set the correct URL for `stripeWebview` (e.g., `/web/stripe/stripe_webview.html`).

4. **Run the app:**
   ```sh
   flutter run -d chrome
   ```

## Usage
- Click the floating action button to initiate a payment of $50.00 (amount can be changed in the code).
- Complete the payment in the Stripe dialog.
- Payment status is logged in the console.

## File Structure
```
lib/
  main.dart                # App entry point
  web_strip_service.dart   # Stripe payment logic
web/
  stripe/
    stripe_webview.html    # Custom Stripe payment page
```

## Security Note
**Never expose your Stripe secret key in production or client-side code.**
For production, use a secure backend to create PaymentIntents and return only the client secret to the frontend.

## Resources
- [Flutter Documentation](https://docs.flutter.dev/)
- [Stripe API Reference](https://stripe.com/docs/api)
- [Stripe Flutter Integration Guide](https://stripe.com/docs/payments/accept-a-payment?platform=web&ui=elements)

## License
This project is licensed under the MIT License.
