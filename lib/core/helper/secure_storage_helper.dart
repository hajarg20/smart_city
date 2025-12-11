// lib/core/helper/secure_storage_helper.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  // إعدادات أندرويد و iOS عشان يشتغل زي الفل على كل الأجهزة
  static final _storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
    iOptions: _getIOSOptions(),
  );

  static const String _keyToken = 'user_token';
  static const String _keyIsLoggedIn = 'is_logged_in';

  // إعدادات أندرويد (مهمة جدًا من أندرويد 13 فما فوق)
  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
    // لو عايز تحط التوكن في KeyStore (أعلى أمان)
    // keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding,
    // storageCipherAlgorithm: StorageCipherAlgorithm.AES_GCM_NoPadding,
  );

  // إعدادات iOS و macOS
  static IOSOptions _getIOSOptions() => const IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  );

  // حفظ التوكن + علامة إنه مسجل دخول
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
    await _storage.write(key: _keyIsLoggedIn, value: 'true');
  }

  // جلب التوكن
  static Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  // هل المستخدم مسجل دخول ولا لأ؟
  static Future<bool> isLoggedIn() async {
    final flag = await _storage.read(key: _keyIsLoggedIn);
    return flag == 'true';
  }

  // أضفنا دالة أحلى في الاسم (اختياري بس أنصح بيها)
  static Future<bool> getIsLoggedIn() async {
    return await isLoggedIn();
  }

  // حذف التوكن وتسجيل الخروج
  static Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
    await _storage.delete(key: _keyIsLoggedIn);
  }

  // تسجيل خروج كامل
  static Future<void> logout() async {
    await deleteToken();
  }

  // لو عايز تمسح كل حاجة في الخزنة (مفيد في التست أو إعادة تعيين الحساب)
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}