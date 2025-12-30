# 📸 Flutter Image Upload App

A simple and practical **Flutter application** that allows users to **select images and upload them to an API backend**.  
Perfect for learning image picking, API integration, HTTP requests, and Flutter widgets.

---

## 🚀 Features

- 📷 Pick images from device (gallery/camera)  
- ☁️ Upload selected images to API  
- 📦 Displays image upload status  
- 📱 Responsive UI  
- 🧠 Built with Flutter best practices

---

## 🛠 Tech Stack

- **Flutter**  
- **Dart**
- **HTTP Package**
- **image_picker Package**
- **Provider / State Management (optional)**



---

## ⚙️ Getting Started

### 1️⃣ Install Flutter
Make sure Flutter is installed and setup:
```bash
flutter --version
```


### 2️⃣ Clone the repository
```bash
git clone https://github.com/bhaumik-1910/Flutter_Image_Upload_API.git
cd Flutter_Image_Upload_API
```


### 3️⃣ Install dependencies
```bash
flutter pub get
```

### 4️⃣ Configure API Endpoint
Open api_service.dart and set your upload API URL:
```bash
const String uploadUrl = "https://your-api-endpoint.com/upload";
```

### 5️⃣ Run the app
Android / iOS / Web
```bash
flutter run
```


###📦 API Integration
The app uses the http package for uploading images:
```bash
final request = http.MultipartRequest(
  'POST',
  Uri.parse(uploadUrl),
);

request.files.add(await http.MultipartFile.fromPath(
  'image',
  pickedFile.path,
));
```

---

## 📄 License

This project is licensed under the **MIT License**.

---

## 👤 Author

**Bhaumik Patel**  
GitHub: [@bhaumik-1910](https://github.com/bhaumik-1910)

---

## ⭐ Support

If you find this project useful, please give it a ⭐ on GitHub!


