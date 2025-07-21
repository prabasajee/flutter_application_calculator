# Flutter Calculator App

A modern, fully functional calculator app built with Flutter. This calculator provides all basic arithmetic operations with a clean, intuitive user interface.

## Features

- ✨ **Basic Operations**: Addition, Subtraction, Multiplication, Division
- 🔢 **Decimal Support**: Handle floating point numbers
- 🔙 **Backspace**: Delete individual digits
- 🧹 **Clear Function**: Reset calculator state
- ⚠️ **Error Handling**: Proper handling of division by zero
- 🎨 **Modern UI**: Dark theme with orange accent colors
- 📱 **Responsive Design**: Works on all screen sizes

## Screenshots

The calculator features a clean, modern interface with:
- Large, easy-to-read display
- Intuitive button layout
- Visual feedback for operations
- Dark theme for better user experience

## Getting Started

### Prerequisites

Make sure you have Flutter installed on your system. If not, follow the [Flutter installation guide](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/prabasajee/flutter_application_calculator.git
   cd flutter_application_calculator
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Usage

The calculator is designed to be intuitive and easy to use:

1. **Input Numbers**: Tap number buttons (0-9) to enter values
2. **Operations**: Tap +, -, ×, ÷ for arithmetic operations
3. **Decimal**: Tap . to add decimal points
4. **Calculate**: Tap = to get the result
5. **Clear**: Tap C to reset everything
6. **Backspace**: Tap ⌫ to delete the last digit

### Example Operations

- Simple addition: `5 + 3 = 8`
- Decimal operations: `2.5 × 4 = 10`
- Chained operations: `10 + 5 - 3 = 12`

## Technical Details

### Architecture

- **Language**: Dart
- **Framework**: Flutter
- **State Management**: StatefulWidget with setState
- **UI Pattern**: Material Design

### Key Components

- `CalculatorApp`: Main application widget
- `CalculatorScreen`: Main calculator interface
- `_CalculatorScreenState`: Manages calculator logic and state

### File Structure

```
lib/
├── main.dart          # Main application entry point and calculator logic
```

## Platform Support

This app runs on:
- 📱 Android
- 🍎 iOS
- 💻 Windows
- 🐧 Linux
- 🌐 Web
- 🖥️ macOS

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Future Enhancements

Potential features to add:
- Scientific calculator functions
- History of calculations
- Themes and customization
- Memory functions (M+, M-, MR, MC)
- Keyboard input support

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Built with [Flutter](https://flutter.dev/)
- Inspired by modern calculator designs
- Material Design guidelines

---

Made with ❤️ using Flutter
