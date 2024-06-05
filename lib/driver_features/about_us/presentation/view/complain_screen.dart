import 'package:ride_options_2/common/const/add_gap.dart';

import '../../../../common/const/export.dart';

class ComplainScreen extends StatefulWidget {
  @override
  _ComplainScreenState createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isButtonEnabled = _controller.text.isNotEmpty;
      });
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:   Text( AppLocalizations.of(context)!.complain,),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:  AppLocalizations.of(context)!.tell_us_your_problem,
                hintStyle: Theme.of(context).textTheme.labelSmall,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            addHeight(20.h),
            ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () {}
                  : null,
              child:  Text( AppLocalizations.of(context)!.submit,
              ),
            ),
          ],
        ),
      ),
    );
  }


}