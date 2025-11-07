import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'item_sura_content.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  String suraText = ''; // 🔹 now store concatenated verses instead of list

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    final size = MediaQuery.of(context).size; // 🔹 get screen dimensions

    if (suraText.isEmpty) {
      loadFile(args.index);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50,
        title: Text(
          args.suraEnName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/sura_ditails_screen.png',
              height: size.height,
              width: size.width,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.02,
              ),
              child: Column(
                children: [
                  Text(
                    args.suraArName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: suraText.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          suraText,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                            height: 1.8,
                            fontSize: size.width * 0.045,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Load and concatenate verses from file
  void loadFile(int index) async {
    final content = await rootBundle.loadString('assets/Suras/${index + 1}.txt');
    setState(() {
      final lines = content
          .split('\n')
          .where((line) => line.trim().isNotEmpty)
          .toList();

      // Concatenate all verses with number at the end (e.g. (1), (2), ...)
      suraText = lines.asMap().entries.map((entry) {
        final i = entry.key + 1;
        final verse = entry.value.trim();
        return "$verse ﴿$i﴾";
      }).join(" "); // Join all verses into one long text
    });
  }
}

class SuraDetailsArgs {
  String suraArName;
  String suraEnName;
  int index;

  SuraDetailsArgs({
    required this.index,
    required this.suraArName,
    required this.suraEnName,
  });
}
