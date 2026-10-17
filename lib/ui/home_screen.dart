import 'dart:async';

import 'package:fastest_path/ui/process_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _urlKey = 'url';

  final TextEditingController _urlController = TextEditingController();
  String? _errorText;

  @override
  void initState() {
    super.initState();
    unawaited(_loadSavedUrl());
  }

  Future<void> _loadSavedUrl() async {
    final preferences = await SharedPreferences.getInstance();
    final savedUrl = preferences.getString(_urlKey);
    if (!mounted || savedUrl == null || savedUrl.isEmpty) {
      return;
    }
    _urlController.text = savedUrl;
  }

  String _normalizeUrl(String value) {
    final trimmed = value.trim();
    if (!trimmed.startsWith('http://') && !trimmed.startsWith('https://')) {
      return 'https://$trimmed';
    }
    return trimmed;
  }

  bool _isValidUrl(String value) {
    final normalized = _normalizeUrl(value);
    final uri = Uri.tryParse(normalized);
    if (uri == null) return false;

    final hasValidScheme = uri.isScheme('http') || uri.isScheme('https');

    final host = uri.host;
    final hasValidHost = host.isNotEmpty && host.contains('.');

    return hasValidScheme && hasValidHost && uri.hasAuthority;
  }

  Future<void> _startCountingProcess() async {
    final rawUrl = _urlController.text.trim();

    if (!_isValidUrl(rawUrl)) {
      setState(() {
        _errorText = 'Please enter a valid URL';
      });
      return;
    }
    final url = _normalizeUrl(rawUrl);
    _urlController.text = url;
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_urlKey, url);

    if (!mounted) {
      return;
    }
    setState(() {
      _errorText = null;
    });
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => ProcessScreen(url: url)));
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home screen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              ' Set valid API base URL in order to continue',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const Icon(Icons.compare_arrows, color: Colors.grey),
                const SizedBox(width: 24),
                Expanded(
                  child: TextField(
                    controller: _urlController,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                      hintText: 'Enter URL',
                      errorText: _errorText,
                    ),
                    onChanged: (value) {
                      if (_errorText != null) {
                        setState(() {
                          _errorText = null;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),

            const Spacer(),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: _startCountingProcess,
              child: const Text('Start counting process'),
            ),
          ],
        ),
      ),
    );
  }
}
