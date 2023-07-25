import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CoursesWidget extends StatelessWidget {
  final String routesName;
  final String bannerImage;
  final String title;

  const CoursesWidget({
    super.key,
    required this.bannerImage,
    required this.title,
    required this.routesName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.pushNamed(context, routesName);
      },
      child: Card(
        child: Container(
          height: 180,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    bannerImage,
                    height: 120,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
              const SizedBox(
                height: 16,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String routesName;
  final String buttonText;

  const CustomButton({
    super.key,
    required this.routesName,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.lightBlue),
      onPressed: () {
        Navigator.pushNamed(context, routesName);
      },
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ConnectivitySnackbarContentWidget extends StatelessWidget {
  final String displayedMessage;
  final IconData displayedIcon;

  const ConnectivitySnackbarContentWidget({
    super.key,
    required this.displayedMessage,
    required this.displayedIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          displayedIcon,
          size: 24,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: AutoSizeText(
            displayedMessage,
            style: const TextStyle(fontSize: 16, color: Colors.white),
            minFontSize: 10,
            stepGranularity: 10,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      ),
    );
  }
}