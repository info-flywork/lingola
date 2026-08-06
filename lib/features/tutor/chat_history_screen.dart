import 'package:flutter/material.dart';

import '../../core/auth/api_client.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';
import '../../core/theme/app_theme.dart';
import '../../widgets/home_asset.dart';
import 'chat_screen.dart';
import 'services/tutor_chat_api_service.dart';

class ChatHistoryScreen extends StatefulWidget {
  const ChatHistoryScreen({super.key});

  @override
  State<ChatHistoryScreen> createState() => _ChatHistoryScreenState();
}

class _ChatHistoryScreenState extends State<ChatHistoryScreen> {
  var _loading = true;
  String? _error;
  List<TutorChatSessionDto> _sessions = const [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final sessions = await TutorChatApiService.listSessions();
      if (!mounted) return;
      setState(() {
        _sessions = sessions;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = e is ApiException ? e.message : e.toString();
      });
    }
  }

  String _displayName(TutorChatSessionDto session) {
    final key = session.tutor?.nameKey ?? session.title ?? '';
    final tutors = AppText.current.tutorPage.tutors;
    switch (key) {
      case 'lingola':
        return tutors.lingola;
      case 'elena':
        return tutors.elena;
      case 'kenji':
        return tutors.kenji;
      case 'freya':
        return tutors.freya;
      case 'camila':
        return tutors.camila;
      case 'marco':
        return tutors.marco;
      case 'julian':
        return tutors.julian;
      case 'ines':
        return tutors.ines;
      case 'felix':
        return tutors.felix;
      case 'diego':
        return tutors.diego;
      case 'amara':
        return tutors.amara;
      case 'erik':
        return tutors.erik;
      case 'katie':
        return tutors.katie;
      case 'morgan':
        return tutors.morgan;
      case 'santa':
        return tutors.santa;
      case 'zephyrion':
        return tutors.zephyrion;
      case 'vaelen':
        return tutors.vaelen;
      case 'ukrath':
        return tutors.ukrath;
      case 'elrion':
        return tutors.elrion;
      default:
        if (key.isEmpty) return 'Tutor';
        return key[0].toUpperCase() + key.substring(1);
    }
  }

  String _imagePath(TutorChatSessionDto session) {
    return session.tutor?.imagePath ?? AppAssets.tutorRobot;
  }

  String _formatTime(String? raw) {
    if (raw == null || raw.isEmpty) return '';
    final dt = DateTime.tryParse(raw)?.toLocal();
    if (dt == null) return '';
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 60) return '${diff.inMinutes.clamp(1, 59)}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    if (diff.inDays < 7) return '${diff.inDays}d';
    return '${dt.day}.${dt.month}';
  }

  @override
  Widget build(BuildContext context) {
    final text = AppText.current.tutorPage;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          tooltip: AppText.current.common.back,
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          text.chatHistory,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.ink,
          ),
        ),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _load,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                children: [
                  if (_error != null) ...[
                    Text(
                      _error!,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Color(0xFFB71C1C),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(onPressed: _load, child: const Text('Tekrar dene')),
                    const SizedBox(height: 12),
                  ],
                  Text(
                    text.history,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (_sessions.isEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        'Henüz sohbet yok. Bir tutor seçip konuşmaya başla.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          color: AppColors.secondary,
                        ),
                      ),
                    )
                  else
                    for (final session in _sessions) ...[
                      _HistoryTile(
                        name: _displayName(session),
                        imagePath: _imagePath(session),
                        preview: session.preview.isEmpty
                            ? 'Konuşmaya başla'
                            : session.preview,
                        time: _formatTime(
                          session.lastMessageAt ?? session.createdAt,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => ChatScreen(
                                tutorName: _displayName(session),
                                imagePath: _imagePath(session),
                                tutorId: session.tutorId,
                                tutorSlug: session.tutor?.slug,
                                sessionId: session.id,
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                ],
              ),
            ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({
    required this.name,
    required this.imagePath,
    required this.preview,
    required this.time,
    required this.onTap,
  });

  final String name;
  final String imagePath;
  final String preview;
  final String time;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: HomeAsset(
                  imagePath,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Text(
                          time,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      preview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        height: 1.35,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
