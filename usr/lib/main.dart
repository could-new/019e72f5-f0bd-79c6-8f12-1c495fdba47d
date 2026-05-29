import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SARFAESI 13(2) Reply Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const NoticeFormScreen(),
      },
    );
  }
}

class NoticeFormScreen extends StatefulWidget {
  const NoticeFormScreen({super.key});

  @override
  State<NoticeFormScreen> createState() => _NoticeFormScreenState();
}

class _NoticeFormScreenState extends State<NoticeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _bankNameController = TextEditingController();
  final _branchNameController = TextEditingController();
  final _bankAddressController = TextEditingController();
  final _borrowerNameController = TextEditingController();
  final _borrowerAddressController = TextEditingController();
  final _loanAccountController = TextEditingController();
  final _noticeDateController = TextEditingController();
  final _replyDateController = TextEditingController();

  String _generatedNotice = "";

  void _generateNotice() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _generatedNotice = '''सेवा में,
प्राधिकृत अधिकारी (Authorized Officer),
${_bankNameController.text},
${_branchNameController.text},
${_bankAddressController.text}

दिनांक: ${_replyDateController.text}

विषय: सरफेसी एक्ट (SARFAESI Act), 2002 की धारा 13(2) के तहत आपके द्वारा जारी नोटिस दिनांक ${_noticeDateController.text} का उत्तर/आपत्ति।

संदर्भ: ऋण खाता संख्या (Loan Account No.) ${_loanAccountController.text}

महोदय,

आपके द्वारा उपर्युक्त ऋण खाते के संदर्भ में मुझे/हमें सरफेसी अधिनियम की धारा 13(2) के अंतर्गत दिनांक ${_noticeDateController.text} को एक नोटिस भेजा गया है। उक्त नोटिस के संबंध में मैं/हम (ऋणधारक का नाम: ${_borrowerNameController.text}) निम्नलिखित तथ्य और आपत्तियां (अधिनियम की धारा 13(3A) के तहत) प्रस्तुत कर रहे हैं:

1. आपके नोटिस में दर्शायी गई बकाया राशि त्रुटिपूर्ण है। मैंने/हमने समय-समय पर जो भुगतान किये हैं, उनका उचित समायोजन खाते में नहीं किया गया है।
2. मेरे/हमारे खाते को एनपीए (NPA) घोषित करने की प्रक्रिया भारतीय रिज़र्व बैंक (RBI) के दिशा-निर्देशों के अनुरूप नहीं है।
3. [यहां अपनी अन्य आपत्तियां या कारण लिखें, जैसे - आर्थिक कठिनाई, व्यापार में नुकसान, बीमारी, या बैंक द्वारा वादे पूरे न करना आदि]
4. मैं/हम बैंक के साथ इस मामले को सुलझाने और बकाया राशि के पुनर्गठन (Restructuring) या एकमुश्त समझौते (OTS) के लिए तैयार हैं।

अतः आपसे अनुरोध है कि:
(क) मेरी/हमारी उपर्युक्त आपत्तियों पर विचार किया जाए और धारा 13(3A) के तहत मुझे/हमें विस्तृत कारण सहित उत्तर प्रदान किया जाए।
(ख) मेरे/हमारे खाते का पुनः परीक्षण कर सही बकाया राशि का विवरण (Statement of Account) मुझे/हमें उपलब्ध कराया जाए।
(ग) जब तक मेरी/हमारी इन आपत्तियों का निपटारा नहीं हो जाता, कृपया सरफेसी अधिनियम के तहत आगे की कोई भी दंडात्मक कार्रवाई (जैसे - संपत्ती पर कब्ज़ा) न की जाए।

धन्यवाद।

भवदीय,
(हस्ताक्षर)
${_borrowerNameController.text}
${_borrowerAddressController.text}
''';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SARFAESI 13(2) Notice Reply'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Form Side
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Bank Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _bankNameController,
                      decoration: const InputDecoration(labelText: 'बैंक का नाम (Bank Name)', border: OutlineInputBorder()),
                      validator: (value) => value!.isEmpty ? 'Please enter bank name' : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _branchNameController,
                      decoration: const InputDecoration(labelText: 'शाखा (Branch)', border: OutlineInputBorder()),
                      validator: (value) => value!.isEmpty ? 'Please enter branch' : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _bankAddressController,
                      decoration: const InputDecoration(labelText: 'बैंक का पता (Bank Address)', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 16),
                    const Text('Borrower Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _borrowerNameController,
                      decoration: const InputDecoration(labelText: 'ऋणधारक का नाम (Borrower Name)', border: OutlineInputBorder()),
                      validator: (value) => value!.isEmpty ? 'Please enter borrower name' : null,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _borrowerAddressController,
                      decoration: const InputDecoration(labelText: 'ऋणधारक का पता (Borrower Address)', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 16),
                    const Text('Notice & Account Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _loanAccountController,
                      decoration: const InputDecoration(labelText: 'ऋण खाता संख्या (Loan Account No.)', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _noticeDateController,
                      decoration: const InputDecoration(labelText: 'नोटिस की तारीख (Notice Date)', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _replyDateController,
                      decoration: const InputDecoration(labelText: 'जवाब की तारीख (Reply Date)', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _generateNotice,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('Generate Reply Notice', style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Preview Side
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Generated Notice Preview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: SelectableText(
                          _generatedNotice.isEmpty 
                              ? 'Fill the form and click "Generate Reply Notice" to see the preview here.' 
                              : _generatedNotice,
                          style: const TextStyle(fontSize: 14, height: 1.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _bankNameController.dispose();
    _branchNameController.dispose();
    _bankAddressController.dispose();
    _borrowerNameController.dispose();
    _borrowerAddressController.dispose();
    _loanAccountController.dispose();
    _noticeDateController.dispose();
    _replyDateController.dispose();
    super.dispose();
  }
}
