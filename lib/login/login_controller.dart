import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

import '../api_services/airtime/airtimeApi_Config.dart';

class LoginController extends GetxController {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  RxString countryCode = ''.obs; // This should be updated dynamically based on the user's selection

  var isPasswordVisible = false.obs;
  var isLoading = false.obs;

  var phoneNumberErrorText = Rx<String?>(null);
  var passwordErrorText = Rx<String?>(null);

  final ApiService _apiService = ApiService(); // Initialize ApiService

  // void updateCountryCode(String newCode) {
  //   countryCode = newCode; // Update the country code
  // }
  @override
  void onClose() {
    // Ensure TextEditingController is disposed of to prevent memory leaks
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!RegExp(r'^\+255\d{9}$').hasMatch(countryCode + value)) {
      // Ensure country code is part of the validation
      return 'Please for currently use +255 country code for Tanzania';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (!RegExp(r'^[A-Z]{2}\d{4}$').hasMatch(value)) {
      return 'Password must be 6 characters (two capital letters and four digits)';
    }
    return null;
  }

  Future<bool> login() async {
    phoneNumberErrorText.value = null;
    passwordErrorText.value = null;

    // Concatenate the country code with the phone number
    final phoneNumber = countryCode + phoneNumberController.text;
    final password = passwordController.text;

    final phoneError = validatePhoneNumber(phoneNumberController.text);
    final passwordError = validatePassword(password);

    if (phoneError != null || passwordError != null) {
      phoneNumberErrorText.value = phoneError;
      passwordErrorText.value = passwordError;
      return false;
    }

    isLoading.value = true;
    try {
      // Pass the concatenated phone number to the API
      final response = await _apiService.post('api/agent/login', {
        'mobile': phoneNumber, // Pass the concatenated phone number
        'password': password,
      });

      if (response.statusCode == 200) {
        try {
          // Attempt to parse JSON
          final data = jsonDecode(response.body);
          Get.snackbar('Success', 'Logged in successfully',
              snackPosition: SnackPosition.TOP, backgroundColor: Color(0xFF66BB6A), colorText: Colors.white);

          // Navigate to OTP verification page with concatenated mobile number
          // Get.to(() => OTPPage(mobile: phoneNumber));
          return true;
        } catch (e) {
          Get.snackbar('Error', 'Failed to parse server response',
              snackPosition: SnackPosition.TOP, backgroundColor: Color(0xFFE53935), colorText: Colors.black26);
          return false;
        }
      } else {
        switch (response.statusCode) {
          case 401:
            Get.snackbar('Error', 'Incorrect phone number or password',
                snackPosition: SnackPosition.TOP, backgroundColor: Color(0xFFE53935), colorText: Colors.black);
            break;
          case 500:
            Get.snackbar('Server Error', 'Internal server error',
                snackPosition: SnackPosition.TOP, backgroundColor: Color(0xFFE53935), colorText: Colors.black);
            break;
          case 404:
            Get.snackbar('Error', 'Endpoint not found',
                snackPosition: SnackPosition.TOP, backgroundColor: Color(0xFFE53935), colorText: Colors.black);
            break;
          default:
            try {
              final data = jsonDecode(response.body);
              Get.snackbar('Error', data['message'] ?? 'Invalid Phone or Password',
                  snackPosition: SnackPosition.TOP, backgroundColor: Color(0xFFE53935), colorText: Colors.black);
            } catch (e) {
              Get.snackbar('Error', 'Server error: ${response.body}',
                  snackPosition: SnackPosition.TOP, backgroundColor: Color(0xFFE53935), colorText: Colors.black);
            }
        }
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Network error or unexpected error occurred: $e',
          snackPosition: SnackPosition.TOP, backgroundColor: Color(0xFFE53935), colorText: Colors.black);
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
