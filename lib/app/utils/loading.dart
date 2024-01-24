import 'dart:async' show StreamController;

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen {
  LoadingScreen._sharedInstance();
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  factory LoadingScreen.instance() => _shared;

  LoadingScreenController? controller;

  void show({
    required BuildContext context,
    String? text,
  }) {
    if (controller?.update(text) ?? false) {
      return;
    } else {
      controller = showOverlay(
        context: context,
        text: text,
      );
    }
  }

  void hide() {
    controller?.close();
    controller = null;
  }

  LoadingScreenController showOverlay({
    required BuildContext context,
    String? text,
  }) {
    final text0 = StreamController<String>();
    if (text != null) {
      text0.add(text);
    }

    final state = Overlay.of(context);

    final overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.black.withAlpha(150),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Lottie.asset(
                      'assets/loading.json',
                      width: 120,
                      height: 120,
                    ),
                    if (text != null) const SizedBox(height: 5),
                    if (text != null)
                      StreamBuilder(
                        stream: text0.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data as String,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            return Container();
                          }
                        },
                      )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    state.insert(overlay);

    return LoadingScreenController(
      close: () {
        text0.close();
        overlay.remove();
        return true;
      },
      update: (text) {
        if (text != null) {
          text0.add(text);
        }
        return true;
      },
    );
  }
}

typedef CloseLoadingScreen = bool Function();

typedef UpdateLoadingScreen = bool Function(String? text);

/// Loading screen controller
@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}
