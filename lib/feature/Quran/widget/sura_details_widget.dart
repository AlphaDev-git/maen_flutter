import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details_screen';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<List<String>> pages = []; // Each page contains a list of ayat
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    final size = MediaQuery.of(context).size;

    if (pages.isEmpty) {
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
        textDirection: TextDirection.rtl, // for Arabic reading and swiping
        child: Stack(
          children: [
            // 🔹 Background
            Image.asset(
              'assets/images/sura_ditails_screen.png',
              height: size.height,
              width: size.width,
              fit: BoxFit.fill,
            ),

            // 🔹 Page content
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

                  // 🔹 PageView for grouped ayat
                  Expanded(
                    child: pages.isEmpty
                        ? const Center(child: CircularProgressIndicator())
                        : PageView.builder(
                      controller: _pageController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (i) => setState(() => currentPage = i),
                      itemCount: pages.length,
                      itemBuilder: (context, index) {
                        return _buildPage(context, pages[index], index, size);
                      },
                    ),
                  ),

                  // 🔹 Page indicator
                  if (pages.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "${currentPage + 1} / ${pages.length}",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600,
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

  /// 🔹 Build each page that contains multiple ayat
  Widget _buildPage(BuildContext context, List<String> ayat, int pageNumber, Size size) {
    return Center(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.02,
          vertical: size.height * 0.01,
        ),
        padding: EdgeInsets.all(size.width * 0.05),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Text(
            ayat.join(" "), // Join verses in this page
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: size.width * 0.05,
              height: 1.8,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 Load sura file and split into pages (7–12 ayat per page)
  void loadFile(int index) async {
    final content = await rootBundle.loadString('assets/Suras/${index + 1}.txt');
    final lines = content
        .split('\n')
        .where((line) => line.trim().isNotEmpty)
        .toList();

    List<String> formattedAyat = [];
    for (int i = 0; i < lines.length; i++) {
      formattedAyat.add("${lines[i].trim()} ﴿${i + 1}﴾");
    }

    // 🔹 Dynamic grouping logic: 7 to 12 ayat per page
    List<List<String>> grouped = [];
    int ayatPerPage;

    if (formattedAyat.length <= 25) {
      ayatPerPage = 7; // short suras
    } else if (formattedAyat.length <= 80) {
      ayatPerPage = 10; // medium suras
    } else {
      ayatPerPage = 12; // long suras
    }

    for (int i = 0; i < formattedAyat.length; i += ayatPerPage) {
      grouped.add(formattedAyat.sublist(
        i,
        i + ayatPerPage > formattedAyat.length
            ? formattedAyat.length
            : i + ayatPerPage,
      ));
    }

    setState(() {
      pages = grouped;
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
