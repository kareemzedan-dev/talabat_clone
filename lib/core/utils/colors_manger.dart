import 'package:flutter/material.dart';

class ColorsManager {
  // اللون الأساسي (طلبات - أورانج)
  static const Color primary = Color(0xFFFF6100);

  // لون ثانوي فاتح (خلفيات/بطاقات خفيفة)
  static const Color secondary = Color(0xFFFFEEE6);

  // لون Accent (ممكن تستخدمه في زرار أو عناصر مميزة)
  static const Color accent = Color(0xFFE21E26); // أحمر قوي

  // لون الخلفية العامة للتطبيق
  static const Color background = Color(0xFFFFFFFF); // أبيض

  // لون للبطاقات
  static const Color card = Color(0xFFFFFFFF);

  // لون النص الرئيسي (غامق)
  static const Color textPrimary = Color(0xFF1C1C1C);

  // لون النص الثانوي / التوضيحي
  static const Color textSecondary = Color(0xFF7A7A7A);

  // أبيض صافٍ (للنصوص فوق خلفية ملونة)
  static const Color white = Color(0xFFFFFFFF);

  // أسود (للاستخدام الخاص)
  static const Color black = Color(0xFF000000);

  // لون أحمر (للأخطاء)
  static const Color error = Color(0xFFFF3B30);

  // لون أخضر (للنجاح)
  static const Color success = Color(0xFF4CAF50);

  // ظل ناعم للعناصر
  static const Color shadow = Color(0x1A000000); // 10% Black
}
