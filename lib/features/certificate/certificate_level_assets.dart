import '../../core/constants/app_assets.dart';

/// CEFR seviyesine göre sertifika rozeti ve etiketleri.
abstract final class CertificateLevelAssets {
  CertificateLevelAssets._();

  /// Rozet görseli — yeni seviyeler eklendikçe genişletilir.
  static String badgeAsset(String level) {
    switch (level.toUpperCase()) {
      case 'A1':
        return AppAssets.certificateA1Starter;
      case 'A2':
        return AppAssets.certificateA2Basic;
      case 'B1':
        return AppAssets.certificateB1Intermediate;
      case 'B2':
        return AppAssets.certificateB2UpperIntermediate;
      case 'C1':
        return AppAssets.certificateC1Advanced;
      case 'C2':
        return AppAssets.certificateC2Expert;
      default:
        return AppAssets.certificateA1Starter;
    }
  }

  static String levelLabel(String level) {
    switch (level.toUpperCase()) {
      case 'A1':
        return 'A1 – Starter';
      case 'A2':
        return 'A2 – Basic';
      case 'B1':
        return 'B1 – Intermediate';
      case 'B2':
        return 'B2 – Upper Intermediate';
      case 'C1':
        return 'C1 – Advanced';
      case 'C2':
        return 'C2 – Expert';
      default:
        return level.toUpperCase();
    }
  }

  /// Liste satırı — Figma: "A1 - Starter Certificate".
  static String listTitle(String level) {
    switch (level.toUpperCase()) {
      case 'A1':
        return 'A1 - Starter Certificate';
      case 'A2':
        return 'A2 - Basic Certificate';
      case 'B1':
        return 'B1 - Intermediate Certificate';
      case 'B2':
        return 'B2 - Upper Intermediate Certificate';
      case 'C1':
        return 'C1 - Advanced Certificate';
      case 'C2':
        return 'C2 - Expert Certificate';
      default:
        return '${level.toUpperCase()} Certificate';
    }
  }

  /// Önizleme veya token yokken gösterilecek varsayılan kimlik.
  static String defaultCertificateId(String level) {
    switch (level.toUpperCase()) {
      case 'A1':
        return 'LIN-001';
      case 'A2':
        return 'LIN-002';
      case 'B1':
        return 'LIN-003';
      case 'B2':
        return 'LIN-004';
      case 'C1':
        return 'LIN-005';
      case 'C2':
        return 'LIN-006';
      default:
        return 'LIN-000';
    }
  }
}
