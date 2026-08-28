import '../../core/auth/api_client.dart';

class CertificateDto {
  const CertificateDto({
    required this.id,
    required this.cefrLevel,
    required this.verifyToken,
    required this.verifyUrl,
    required this.issuedAt,
  });

  final String id;
  final String cefrLevel;
  final String verifyToken;
  final String verifyUrl;
  final DateTime? issuedAt;

  factory CertificateDto.fromJson(Map<String, dynamic> json) {
    final rawDate = json['issuedAt'] as String?;
    return CertificateDto(
      id: json['id'] as String? ?? '',
      cefrLevel: (json['cefrLevel'] as String? ?? '').toUpperCase(),
      verifyToken: json['verifyToken'] as String? ?? '',
      verifyUrl: json['verifyUrl'] as String? ?? '',
      issuedAt: rawDate == null ? null : DateTime.tryParse(rawDate),
    );
  }
}

class CertificatesSummaryDto {
  const CertificatesSummaryDto({
    required this.certificates,
    required this.highestLevel,
  });

  final List<CertificateDto> certificates;
  final String? highestLevel;

  factory CertificatesSummaryDto.empty() {
    return const CertificatesSummaryDto(certificates: [], highestLevel: null);
  }

  factory CertificatesSummaryDto.fromJson(Map<String, dynamic> json) {
    final list = json['certificates'];
    return CertificatesSummaryDto(
      certificates: list is List
          ? list
              .whereType<Map<String, dynamic>>()
              .map(CertificateDto.fromJson)
              .toList()
          : const [],
      highestLevel: json['highestLevel'] as String?,
    );
  }

  CertificateDto? get primary {
    if (certificates.isEmpty) return null;
    return certificates.last;
  }
}

abstract final class CertificateApiService {
  static Future<CertificatesSummaryDto> fetchMine() async {
    final data = await ApiClient.get('/certificates/me', auth: true);
    if (data['ok'] != true) {
      return CertificatesSummaryDto.empty();
    }
    return CertificatesSummaryDto.fromJson(data);
  }
}
