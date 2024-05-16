
# VitalTrack

VitalTrack is a Flutter mobile application designed to leverage various sensors to monitor environmental and personal health metrics. It includes features such as a step counter, compass, proximity sensor, light sensor, and integration with Google Maps for location tracking.

## Features

- **Step Counter**: Uses the device's accelerometer to count your steps.
- **Compass**: Displays your direction using the magnetometer sensor.
- **Proximity Sensor**: Detects if something is near to the device.
- **Light Sensor**: Monitors the ambient light level and notifies the user when it's too high or too low.
- **Maps**: Shows your current location, and tracks your movement with polyline drawing.

## Prerequisites

Before you begin, ensure you have met the following requirements:
- Flutter SDK (Channel stable, latest version)
- Android Studio or Visual Studio Code with Flutter plugins
- An Android or iOS device or an emulator for testing

## Installation

1. **Clone the repository:**

```bash
git clone [https://your-repository-url.git](https://github.com/bienheureuseuwineza/VitalTrack.git)
cd VitalTrack
```

2. **Install dependencies:**

```bash
flutter pub get
```

3. **Set up local notifications:**

Ensure you have the correct Android permissions in your `AndroidManifest.xml` for local notifications and any sensors like GPS or accelerometer.

4. **API Keys:**

Replace `GOOGLE_MAPS_API_KEY` in your code with a valid Google Maps API key.

## Running the App

To run VitalTrack on a connected device or emulator, use the following command:

```bash
flutter run
```

## Building

To build an APK or app bundle, use one of the following commands:

- **Build APK:**

```bash
flutter build apk
```

- **Build App Bundle (recommended for Google Play):**

```bash
flutter build appbundle
```

## Contributing

Contributions to the project are welcome! Please adhere to this project's `code of conduct` while contributing.

## License

Distributed under the MIT License. See `LICENSE` for more information.
