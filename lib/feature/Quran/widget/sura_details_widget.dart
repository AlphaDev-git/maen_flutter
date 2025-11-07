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
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;

    if (verses.isEmpty) {
      loadFile(args.index);
    }

    // Group verses so that each "page" has multiple verses (e.g., 5)
    final int versesPerPage = 5; // 👈 change this number as needed
    final int pageCount = (verses.length / versesPerPage).ceil();

    return Scaffold(
      appBar: AppBar(
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
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    args.suraArName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Expanded(
                  child: verses.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pageCount,
                    itemBuilder: (context, pageIndex) {
                      final start = pageIndex * versesPerPage;
                      final end = (start + versesPerPage > verses.length)
                          ? verses.length
                          : start + versesPerPage;

                      final pageVerses = verses.sublist(start, end);

                      return SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: pageVerses.asMap().entries.map((entry) {
                            final i = entry.key + start;
                            final verse = entry.value;
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 3.0),
                              child: itemsuracontent(
                                content: verse,
                                index: i,
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void loadFile(int index) async {
    final content = await rootBundle.loadString('assets/Suras/${index + 1}.txt');
    setState(() {
      verses = content.split('\n').where((line) => line.trim().isNotEmpty).toList();
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
